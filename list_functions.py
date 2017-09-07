"""
Some useful list functions in Python
"""

from functools import reduce

# any - is any value true? (or truthy):
print(any([True, False, False]))
print(any(i % 3 == 0 for i in [2, 3, 4]))
print(any(i % 3 == 0 for i in [2, 4, 5]))

print()

# all - are all of the values true?
print(all([True, True, True]))
print(all(i % 3 == 0 for i in [0, 4, 6]))
print(all(i % 3 == 0 for i in [0, 3, 6]))

# These two functions in Python 3 return an iterable but not a list, so we have
# to build a list.

# map - apply a function to everyting in a list
print(list(map(int, "123")))

# filter - filter a list (see lambda functions)
print(list(filter(lambda x: x < 4, range(20))))

# reduce - apply a function to everything in a list to "reduce" the list to one
# value (produces 6!).
print(reduce(lambda x, y: x * y, range(1, 6)))
