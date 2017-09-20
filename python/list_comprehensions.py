"""
List comprehensions in Python. List comprehensions are great - where you might
normally want to do something like squaring each number in a list, list
comprehensions provide an easy way out.
"""

l = range(10)

output = []
for i in l:
    output.append(i ** 2)

print(output)

# However, we can do this:

output = [i ** 2 for i in l]

print(output)

# If we want a doubly nested loop - maybe a flat multiplication table:

table = []
for a in range(10):
    for b in range(10):
        table.append(a * b)

print(table)

# You can translate it to a list comprehension, keeping the loops in the same order.

table = [a * b for a in range(10)
               for b in range(10)]

print(table)

# We can also add an if-statement (predicate). For example, we might do this:

pyth_limit = 20

pyth_triples = [(a, b, c) for a in range(1, pyth_limit)
                          for b in range(1, pyth_limit)
                          for c in range(1, pyth_limit)
                          if a ** 2 + b ** 2 == c ** 2]

print(pyth_triples)

# Note that this can be massively optimised - exercise for the reader : )

# More simply, all the number up to 50 containing the digit 5:

print([i for i in range(50) if "5" in str(i)])
