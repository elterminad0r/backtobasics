"""
Lists store multiple values which you might put in a variable. Lists can also
be iterated over using a for loop.
"""

# a list
a = [10, 9, 12]

print(a) # print the whole thing
print(a[0]) # print the first thing
print(len(a)) # print the length

# iterate over the list
for i in a:
    print(i)

# also produces a list - .split returns a list
a = "foo bar baz".split()

# also get the positions. If you need the positions, this is a better idea than
# using range(len(a))
for ind, i in enumerate(a):
    print("{} is at {}".format(i, ind))
