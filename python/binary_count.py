"""
A bitwise little-endian binary counter
"""

def increase_number(n):
    if n:
        head, *tail = n
        if head == 0:
            return [1] + tail
        return [0] + increase_number(tail)
    return []

number = [1] * 8

for i in range(256):
    number = increase_number(number)
    print("{:>3}: {}".format(i, "".join(map(str, reversed(number)))))
