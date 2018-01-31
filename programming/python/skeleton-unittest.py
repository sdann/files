#!/usr/bin/env python
#
# To debug:
#    python -m pdb ./skeleton-unittest.py
# To run specific test:
#    python -m unittest skeleton-unittest.TestAuthLogIn.testValidToken

"""
Tests using unittest framework
"""

import logging
import os
import time
import unittest

#
# Defines
#

#
# Globals
#

# Logging
logger = logging.getLogger()

#
# Helper Functions
#

class Timer:
    def __enter__(self):
        self.start = time.time()
        return self

    def __exit__(self, *args):
        self.end = time.time()
        self.interval = self.end - self.start

#
# Core Logic
#

class TestAuthLogInToken(unittest.TestCase):
    '''Test sending invalid Auth tokens to connect.'''

    def testTokenValid(self):
        '''Sanity check with a valid login.'''
        pass


if __name__ == '__main__':
    file_handler = logging.FileHandler(os.getcwd() + os.sep + "unittest" +
            ".log")
    file_handler.setFormatter(logging.Formatter(
            '%(asctime)s [%(levelname)s][%(name)s][%(lineno)d] %(message)s'))
    logger = logging.getLogger()
    logger.addHandler(file_handler)
    logger.setLevel(logging.WARNING)

    unittest.main()
