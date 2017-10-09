from math import sqrt
from itertools import repeat

def fibratios():
    a, b = 1, 1
    for _ in repeat(None):
        yield b / a
        a, b = b, a + b

fb = fibratios()

actual = (1 + sqrt(5)) / 2

while True:
    input()
    val = next(fb)
    print("{:.17f}: {:+.3e}".format(val, actual - val))
