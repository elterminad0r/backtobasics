"""
The principle of "unpacking" in Python
"""

# this is a list
l = [1, 2, 3]

# you can unpack it into variables like this:
a, b, c = l

print(a, b, c)

# other options that do exactly the same:
# (a, b, c) = l
# (a, b, c,) = l
# [a, b, c] = l
# [a, b, c,] = l

# To unpack a 1-length list the following are available:
# a, = [1]
# (a,) = [1]
# [a] = [1]
# [a,] = [1]

# There is another fun trick: unpack a couple of bits into variables and unpack the rest into another list:
k = [1, 2, 3, 4, 5, 6]
x, y, *z = k
print(x, y, z)
x, y, *z, w = k
print(x, y, z, w)
*x, y, x = k
print(x, y, z)
# You can only have one * variable in an unpacking, and it will always be a list.

# If you have an iterable of tuples:
coords = [(1, 2), (3, 4)]
# You can unpack it while iterating:
for x, y in coords:
    print("x is {} and y is {}".format(x, y))

# If you have a function that expects, say, 3 arguments:
def f(a, b, c):
    print(a + b + c)

# You can "unpack" a list you're passing to it
f(*l)
