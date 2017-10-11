from string import ascii_uppercase
from itertools import islice

def letters(n):
    a, b = 1, 2
    path = [1]
    print("a")
    while (a, b) != (1, 1):
        print(ascii_uppercase[a - 1])
        path.append(a)
        a, b = b, a + b
        if b > 26:
            b -= 26
    print("FOUND IT")
    print("RESULTING LETTER: {}".format(path[n % len(path)]))

letters(1000000)
