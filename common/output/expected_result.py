# -*- coding: utf-8 -*-
'''
expected_result.py derives from test_result.py
It defines expected result serial feedback 

'''

from pyshould import *

from common.test_result import TestResult


class ExpectedResult(TestResult):
    '''
    ExpectedResult derives from TestResult
    '''

    dict = {}

    def __init__(self):
        '''
        constructor of ExpectedResult
        '''
        super(ExpectedResult, self).__init__()

    def should_equal(self, actual_result, key, value):
        self.set_value(key, value)
        actual_result.mock_value(key, value)
        actual_result.get_value(key) | should.equal(self.get_value(key))

    def should_not_equal(self, actual_result, key, value):
        self.set_value(key, value)
        actual_result.mock_value(key, value)
        actual_result.get_value(key) | should_not.equal(self.get_value(key))

    def should_be_greater_than(self, actual_result, key, value):
        self.set_value(key, value)
        actual_result.mock_value(key, value)
        actual_result.get_value(key) | should.be_greater_than(self.get_value(key))

    def should_be_less_than(self, actual_result, key, value):
        self.set_value(key, value)
        actual_result.mock_value(key, value)
        actual_result.get_value(key) | should.be_less_than(self.get_value(key))

    def should_not_null(self, actual_result, key):
        actual_result.mock_value(key, "PADDING")
        len(actual_result.get_value(key)) | should_not.equal(0)

    def should_null(self, actual_result, key, value):
        actual_result.mock_value(key, value)
        len(actual_result.get_value(key)) | should.equal(0)

    def should_contains_string(self, actual_result, key, value):
        self.set_value(key, value)
        actual_result.mock_value(key, value)
        actual_result.get_value(key) | should.have_the_substring(self.get_value(key))
