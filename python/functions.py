"""
Functions in Python - what they do, how to use them, some examples.
"""

# A function is made with def function_name(arguments):
# You can do as many arguments as you like

# A function might just print something and return nothing:
def add_up(a, b, c):
    print(a + b + c)

# It might also do some more computation and end up returning something:
def fibo(n):
    #a = 0
    #b = 1
    a, b = 0, 1

    for _ in range(n):
        a, b = b, a + b

    return b

# You can also say what the default value of an argument is:
def multiply(a, b=1):
    return a * b

# Everything can be default:
def divide(a=36, b=9):
    return a // b

# You can also "collect" any extra arguments like this:
def print_all(a, *args):
    print("the first thing was {}".format(a))
    for i in args:
        print(i)

# *args puts a list in args, so you could do something like this:
def how_many(*args):
    print("got {} thing{}".format(len(args), bool(len(args) - 1) * "s"))

if __name__ == "__main__":
    add_up(1, 2, 3)

    print()

    # This can be improved upon with a generator
    for i in range(10):
        print(fibo(i))

    print()

    print(multiply(3, 4))
    print(multiply(5))

    print()

    # You can specify only one of the default arguments if you want
    print(divide(b=4))

    print()

    print_all(1, 2, 3, 4)

    print()

    how_many(1, 2, 3, 4, 5)
    how_many(0)
