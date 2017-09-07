"""
importing functions! They're reusable.
Print the area of a circle given a (sanitised) radius
"""

from validation import get_type
from functions import get_area

radius = get_type(float, "Enter a radius> ")

print("the area is {}".format(get_area(radius)))
