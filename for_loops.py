"""
The Python for loop is a powerful way to express iteration. It actually works
by iterating over any collection of values - not just range. You can iterate
over lists, strings, dicts, tuples and in fact objects built only to iterate
over that you can't index like a list.
"""

for i in range(5):
    print(i)

print()

for i in range(3, 10):
    print(i)

print()

for i in range(0, 10, 2):
    print(i)

print()

for i in ["abc", "def"]:
    print(i)

print()

for i in "izaak":
    print(i)
