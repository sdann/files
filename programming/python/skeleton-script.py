#!/usr/bin/env python

"""
Script to...
"""

import logging
import os

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

#
# Core Logic
#

def main():
    pass


if __name__ == '__main__':
    file_handler = logging.FileHandler(os.getcwd() + os.sep + "unittest" +
            ".log")
    file_handler.setFormatter(logging.Formatter(
            '%(asctime)s [%(levelname)s][%(name)s][%(lineno)d] %(message)s'))
    logger = logging.getLogger()
    logger.addHandler(file_handler)
    logger.setLevel(logging.WARNING)

    main()
