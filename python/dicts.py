"""
Dictionaries store values that can be accessed by a key which
doesn't have to be an integer (it should be hashable though - only strings,
integers, floats, and 'tuples' are allowed)
"""

# this is how you make a dict
d = {"a": 3,
     "b": 2}

print(d)

# iterate over items
for key, val in d.items():
    print("The key {} is {}".format(key, val))

# iterate over keys
for key in d:
    print(d)

# you can also make an identical dict like this:
d = dict([("a", 3), ("b", 2)])
