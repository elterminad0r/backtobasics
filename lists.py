"""
Lists store multiple values which you might put in a variable. Lists can also
be iterated over using a for loop. You can get values from the start or the end
of a list (remember they're 0-indexed). You can also get a smaller "slice" of
the list by slicing it.
"""

# a list
a = [10, 9, 12]

print(a) # print the whole thing
print(a[0]) # print the first thing
print(len(a)) # print the length
print(9 in a) # check if something is in a

print(a[len(a) - 1]) # print the first thing from the end

# but wait!
# we can do exactly the same but just leave out the len call. (nasty old judge)
print(a[-1])

# iterate over the list
for i in a:
    print(i)

# also produces a list - .split returns a list
a = "foo bar baz".split()

# You can add things to a list:
a.append("apples")

# also get the positions. If you need the positions, this is a better idea than
# using range(len(a))
for ind, i in enumerate(a):
    print("{} is at {}".format(i, ind))

# slicing a list:
l = list(range(20))
print(l)
# the slice from 4 to 12
print(l[4:12])
# the slice from the start to 5
print(l[:5])
# the slice from 15 to the end
print(l[15:])
# the slice from 5 to 15 with a step of 2
print(l[5:15:2])

# strings often behave very similarly to lists:
print("abc"[1])
print("abc"[:2])
print("abc"[::2])
print("abc"[::-1])

# a higher dimensional list acts just how you'd expect:
l = [[1, 2], [3, 4]]
print(l[1][0])
