"""
If statement in Python don't always need to have True or False - you could also do if 1, if "abc", if [] - in fact, any python object can be used as the condition. They have a certain behaviour - an object considered "empty" will act like False - for example, 0, "", [] and {} are called falsy objects. Any other object is truthy
"""

if 1 and [1] and "abc":
    print("all true")

if not (0 or [] or ""):
    print("all false")
