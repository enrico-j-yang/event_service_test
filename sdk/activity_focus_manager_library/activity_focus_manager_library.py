import logging
import threading

try:
    import Queue as queue
except ImportError:
    import queue

from .channel import Channel
from .channel import FocusState

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class Executor(object):
    def __init__(self, delay_exit):
        self.thread_running = False
        self.timeout = delay_exit
        self.shutdown = False
        self.queue = queue.Queue()
        self.t = threading.Thread(target=self.executor)
        self.t.start()

    def executor(self):
        while True:
            func, arg_list = self.queue.get(timeout=0.25)

            if func is not None:
                func(arg_list)

    def submit(self, func, arg_list):
        self.queue.put((func, arg_list,))

    def submit_to_front(self, func, arg_list):
        new_queue = queue.Queue()
        new_queue.put((func, arg_list,))
        while not self.queue.empty():
            new_queue.put(self.queue.get())

        self.queue = new_queue


class ChannelConfiguration(object):
    def __init__(self, config_name, config_priority):
        self.name = config_name
        self.priority = config_priority

    def to_string(self):
        return "name:'" + self.name + "', priority:" + str(self.priority)


class ActivityFocusManagerLibrary(object):
    '''
    焦点管理模块，实现功能包括:
        视觉焦点管理
        音频焦点管理
    '''

    # The default Dialog Channel name.
    DIALOG_CHANNEL_NAME = "Dialog"

    # The default dialog Channel priority.
    DIALOG_CHANNEL_PRIORITY = 100

    # The default Communications Channel name.
    COMMUNICATIONS_CHANNEL_NAME = "Communications"

    # The default Communications Channel priority.
    COMMUNICATIONS_CHANNEL_PRIORITY = 150

    # The default Alerts Channel name.
    ALERTS_CHANNEL_NAME = "Alerts"

    # The default Alerts Channel priority.
    ALERTS_CHANNEL_PRIORITY = 200

    # The default Content Channel name.
    CONTENT_CHANNEL_NAME = "Content"

    # The default Content Channel priority.
    CONTENT_CHANNEL_PRIORITY = 300

    # The default Visual Channel name.
    VISUAL_CHANNEL_NAME = "Visual"

    # The default Visual Channel priority.
    VISUAL_CHANNEL_PRIORITY = 100

    def __init__(self, channel_configurations, activity_tracker):
        '''
        类初始化
        '''
        self.all_channels = []
        self.active_channels = []
        self.observers = []
        self.activity_updates = []
        self.activity_tracker = None
        self.executor = Executor(0.25)
        self.lock = threading.Lock()

        for config in channel_configurations:
            if not self._does_channel_name_exist(config.name):
                continue
            if not self._does_channel_priority_exist(config.priority):
                continue

            channel = Channel(config.name, config.priority)
            self.all_channels.append((config.name, channel,))

        self.activity_tracker = activity_tracker

    def acquire_channel(self, channel_name, channel_observer, interface):
        channel_to_acquire = self._get_channel(channel_name)
        if not channel_to_acquire:
            return False

        self.executor.submit(self._acquire_channel_helper, (channel_to_acquire, channel_observer, interface,))

        return True

    def release_channel(self, channel_name, channel_observer):
        # // Using a shared_ptr here so that the promise stays in scope by the time the Executor picks up the task.
        # auto releaseChannelSuccess = std::make_shared<std::promise<bool>>();
        # std::future<bool> returnValue = releaseChannelSuccess->get_future();
        return_value = None
        channel_to_release = self._get_channel(channel_name)
        if not channel_to_release:
            return False

        self.executor.submit(self._release_channel_helper, (channel_to_release, channel_observer, return_value, channel_name,))

        return return_value

    def stop_foreground_activity(self):
        # We lock these variables so that we can correctly capture the currently foregrounded channel and activity.
        foreground_channel = self._get_highest_priority_active_channel_locked()
        if not foreground_channel:
            return

        foreground_channel_interface = foreground_channel.get_interface()

        self.executor.submit_to_front(self._stop_foreground_activity_helper, (foreground_channel, foreground_channel_interface,))

    def add_observer(self, observer):
        self.observers.append(observer)

    def remove_observer(self, observer):
        self.lock.acquire()
        self.observers.pop(observer)
        self.lock.release()

    def _set_channel_focus(self, channel, focus):
        if not channel.set_focus(focus):
            return

        self.lock.acquire()
        observers = self.observers
        self.lock.release()
        for observer in observers:
            observer.on_focus_changed(channel.get_name(), focus)

        #self.activity_updates.push_back(channel.get_state())

    def _acquire_channel_helper(self, channel_to_acquire, channel_observer, interface):
        self._set_channel_focus(channel_to_acquire, FocusState.NONE)

        # Lock here to update internal state which stopForegroundActivity may concurrently access.
        self.lock.acquire()
        foreground_channel = self._get_highest_priority_active_channel_locked()
        channel_to_acquire.set_interface(interface)
        self.active_channels.append(channel_to_acquire)
        self.lock.release()

        # Set the new observer.
        channel_to_acquire.set_observer(channel_observer)

        if not foreground_channel:
            self._set_channel_focus(channel_to_acquire, FocusState.FOREGROUND)
        elif foreground_channel == channel_to_acquire:
            self._set_channel_focus(channel_to_acquire, FocusState.FOREGROUND)
        elif channel_to_acquire.get_priority() > foreground_channel.get_priority():
            self._set_channel_focus(foreground_channel, FocusState.BACKGROUND)
            self._set_channel_focus(channel_to_acquire, FocusState.FOREGROUND)
        else:
            self._set_channel_focus(channel_to_acquire, FocusState.BACKGROUND)

    def _release_channel_helper(self, channel_to_release, channel_observer, release_chanel_success, name):
        if channel_to_release.does_observer_own_channel(channel_observer):
            release_chanel_success = False
            return

        release_chanel_success = True
        self.lock.acquire()
        was_foregrounded = self._is_channel_foregrounded_locked(channel_to_release)
        self.active_channels.pop(channel_to_release)
        self.lock.release()

        self._set_channel_focus(channel_to_release, FocusState.NONE)
        if was_foregrounded:
            self._foreground_highest_priority_active_channel()

        self._notify_activity_tracker()

    def _stop_foreground_activity_helper(self, foreground_channel, foreground_channel_interface):
        if foreground_channel_interface != foreground_channel.get_interface():
            return

        if foreground_channel.has_observer():
            return

        self._set_channel_focus(foreground_channel, FocusState.NONE)

    def _get_channel(self, channel_name):
        search = [channel for channel in self.all_channels if channel.name == channel_name][0]
        if search != self.all_channels[-1]:
            return search[1]

    def _get_highest_priority_active_channel_locked(self):
        if len(self.active_channels) == 0:
            return None
        return self.active_channels[0]

    def _is_channel_foregrounded_locked(self, channel):
        return self._get_highest_priority_active_channel_locked() == channel

    def _does_channel_name_exist(self, name):
        for it in self.all_channels:
            if it.name == name:
                return True
        return False

    def _does_channel_priority_exist(self, priority):
        for it in self.all_channels:
            if it.priority == priority:
                return True
        return False

    def _foreground_highest_priority_active_channel(self):
        # Lock here to update internal state which stopForegroundActivity may concurrently access.
        self.lock.acquire()
        channel_to_foreground = self._get_highest_priority_active_channel_locked()
        self.lock.release()

        if channel_to_foreground:
            self._set_channel_focus(channel_to_foreground, FocusState.FOREGROUND)

    def _notify_activity_tracker(self):
        if self.activity_tracker:
            self.activity_tracker.notify_of_activity_updates(self.activity_updates)

        self.activity_updates.clear()

    @staticmethod
    def get_default_audio_channels():
        default_audio_channels = [ChannelConfiguration(ActivityFocusManagerLibrary.DIALOG_CHANNEL_NAME,
                                                       ActivityFocusManagerLibrary.DIALOG_CHANNEL_PRIORITY),
                                  ChannelConfiguration(ActivityFocusManagerLibrary.ALERTS_CHANNEL_NAME,
                                                       ActivityFocusManagerLibrary.ALERTS_CHANNEL_PRIORITY),
                                  ChannelConfiguration(ActivityFocusManagerLibrary.COMMUNICATIONS_CHANNEL_NAME,
                                                       ActivityFocusManagerLibrary.COMMUNICATIONS_CHANNEL_PRIORITY),
                                  ChannelConfiguration(ActivityFocusManagerLibrary.CONTENT_CHANNEL_NAME,
                                                       ActivityFocusManagerLibrary.CONTENT_CHANNEL_PRIORITY)]
        return default_audio_channels

    @staticmethod
    def get_default_visual_channels():
        default_visual_channels = [ChannelConfiguration(ActivityFocusManagerLibrary.VISUAL_CHANNEL_NAME,
                                                        ActivityFocusManagerLibrary.VISUAL_CHANNEL_PRIORITY)]
        return default_visual_channels
