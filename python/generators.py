"""
Generators in Python. Generators are a kind of function, but they don't just
return one thing - they can return lots and lots of things. They use the
keyword yield instead of return. They can't be used like a normal list for
indexing - you can't do some_generator[0]. However they can be used in a for
loop - they're iterable but not indexable.
"""

# Very simple generator
def abc():
    yield 1
    yield 2
    yield 3

# This is an infinite generator - be careful with these. Fun project: modify
# this so it takes an argument n and only counts up to n - wait a minute, that
# sounds a lot like the range function! Can you write a custom_range function
# that behaves exactly like range (without building any lists). You'll have to
# refer to functions.py on how to take input.
def count():
    counter = 0
    while True:
        counter += 1
        yield counter

# This is a good use of a generator, if you want to print all the fibonacci
# numbers without going back to the start each time, but without having to save
# them in a list either.
def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        yield b
        a, b = b, a + b

if __name__ == "__main__":
    # iterate over abc
    for i in abc():
        print(i)
    print()

    # get the first couple of values from count, using next
    i = 0
    counter = count()
    while i < 10:
        print(i)
        i = next(counter)
    print()

    # The first 10 fibonacci numbers:
    for fib in fibonacci(10):
        print(fib)
