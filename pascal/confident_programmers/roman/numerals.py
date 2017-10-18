import pprint
from itertools import chain

digits = [("M", 1000),
          ("CM", 900),
          ("D", 500),
          ("CD", 400),
          ("C", 100),
          ("XC", 90),
          ("L", 50),
          ("XL", 40),
          ("X", 10),
          ("IX", 9),
          ("V", 5),
          ("IV", 4),
          ("I", 1)]

def get_numeral(n, digits=digits):
    if n:
        (d, val), *digits = digits
        q, r = divmod(n, val)
        return "{}{}".format(d * q, get_numeral(r, digits))
    return ""

MAX = 200

if __name__ == "__main__":
    for i in range(MAX):
        print("{:{max}} {}".format(i, get_numeral(i), max=len(str(MAX))))
