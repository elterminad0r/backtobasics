"""
If statements in Python - conditionally executing code.
"""

if True:
    print("True is True")

if 2 == 3:
    print("2 is 3")

if 3 > 2:
    print("3 > 2")
else:
    print("it was not")

if "izaak".startswith("I"):
    print("it was capital")
elif "izaak".startswith("i"):
    print("it was not")
else:
    print("that's not my name..")

if not 2 > 3 and 6 == 6:
    print("that was all true")
