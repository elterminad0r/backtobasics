"""
Date and time in Python. Some simple examples - refer to the Python docs for
lots more info on how to use it.
"""

import datetime

stamp = datetime.datetime.now().strftime("%d/%m/%Y")

print("the date now is: {}".format(stamp))
