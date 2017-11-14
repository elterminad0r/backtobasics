"""
Approximate pi
"""

import sys
import time
import argparse
import itertools

import mpmath

from fractions import gcd, Fraction
from decimal import Decimal

def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("-p", "--prec", default=7, type=int,
                                    help="precision to calculate")
    parser.add_argument("-f", "--fracs", action="store_true",
                                    help="show fractional parts")
    parser.add_argument("-s", "--skip", default=(1 << len(FUNCS)) - 1, type=int,
                                    help="functions to skip")
    parser.add_argument("-m", "--mdps", default=50, type=int,
                                    help="number of decimal places for actual pi")
    return parser.parse_args()

def to_base(num, base, width):
    if width:
        q, r = divmod(num, base)
        yield r
        yield from to_base(q, base, width - 1)

def naive(prec):
    val = 3
    for i in range(1, prec + 1):
        if val == val + (i % 2 - 1 or 1) / (i * (i + 1) * (2 * i + 1)):
            print("**float precision barrier reached at iteration {}".format(i))
            break
        val += (i % 2 - 1 or 1) / (i * (i + 1) * (2 * i + 1))
    fr = Fraction(val)
    return (fr.numerator, fr.denominator), val

def with_hand_working(prec):
    n, d = 18, 6
    for i in range(1, prec + 1):
        sub_denom = i * (i + 1) * (2 * i + 1)
        n += d // sub_denom * (i % 2 - 1 or 1)
        factor = (i + 2) * (2 * i + 3)
        n *= factor
        d *= factor
    return (n, d), n / d

def frac_lib(prec):
    res = Fraction(3)
    for i in range(1, prec + 1):
        res += Fraction(i % 2 - 1 or 1, i * (i + 1) * (2 * i + 1))
    return (res.numerator, res.denominator), float(res)

def multiplicative(prec):
    n, d = 3, 1
    for i in range(1, prec + 1):
        n_, d_ = i % 2 - 1 or 1, i * (i + 1) * (2 * i + 1)
        n, d, n_ = n * d_, d * d_, n_ * d
        n += n_
    return (n, d), n / d

def mpmath_pi(prec):
    print(mpmath.pi(prec))
    return (0, 0), 0

FUNCS = [naive, frac_lib, with_hand_working, multiplicative, mpmath_pi]

if __name__ == "__main__":
    args = parse_args()
    print("precision set to {}, skips to {}".format(args.prec, args.skip))
    mpmath.mp.dps = args.mdps
    print("actual pi ~\n{}".format(+mpmath.pi))
    for fn, dontskip in zip(FUNCS, to_base(args.skip, 2, len(FUNCS))):
        print(fn.__name__)
        if not dontskip:
            print("skipping\n")
            continue
        start = time.time()
        frac, real = fn(args.prec)
        print("result {:.20f}, took {:.6f} secs".format(real, time.time() - start))
        if args.fracs:
            print("fraction was approx {:.10e} / {:.10e}\n".format(*map(Decimal, frac)))
