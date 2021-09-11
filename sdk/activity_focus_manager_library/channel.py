import time


class FocusState(object):
    NONE = 0
    FOREGROUND = 2
    BACKGROUND = 1


class State(object):
    name = None
    interface_name = None

    def __init__(self, name):
        self.name = name
        self.focus_state = FocusState.NONE
        self.time_at_idle = time.time()



class Channel(object):
    def __init__(self, name, priority):
        self.state = State(name)
        self.priority = priority
        self.observer = None
        self.focus = None
        self.interface = None

    def get_name(self):
        return self.state.name

    def get_priority(self):
        return self.priority

    def set_focus(self, focus):
        if focus == self.state.focus_state:
            return False
        self.state.focus_state = focus
        if self.observer:
            self.observer.on_focus_changed(self.state.focus_state)

        if FocusState.NONE == self.state.focus_state:
            self.observer = None
            self.state.time_at_idle = time.time()

        return True

    def set_observer(self, observer):
        self.observer = observer

    def has_observer(self):
        return self.observer is not None

    def set_interface(self, interface):
        self.state.interface = interface

    def get_interface(self):
        return self.state.interface_name

    def does_observer_own_channel(self, observer):
        return self.observer == observer

    def get_state(self):
        return self.state
