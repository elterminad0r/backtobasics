"""
Recursion is the concept of calling yourself. This can be very useful. Here are
a couple of sample recursive functions - note that they always have some kind
of "bottom case" where they stop, otherwise your program will keep running
forever (useful trick, press control-c if this happens)
"""

def triangle(n):
    # see truthiness.py
    if n:
        return n + triangle(n - 1)
    return 0

# Note that this is actually very inefficient - it has to calculate the value
# of fibo(3) many times. However, it's a good example of recursion
def fibo(n):
    if n > 2:
        return fibo(n - 2) + fibo(n - 1)
    return 1

# see slicing in lists.py for details, but could be
# return s == s[::-1]
def is_palindrome(s):
    return s[0] == s[-1] and is_palindrome(s[1:-1])
