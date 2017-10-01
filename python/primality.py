import itertools

from functools import lru_cache
from math import gcd

def first_n_naive(n):
    if p < 2:
        return False
    for i in range(2, p):
        if i ** 2 > p:
            break
        if p % i == 0:
            return False
    return True

def poss_primes(n):
    yield 2
    yield 3

    for i in itertools.count(1):
        yield i * 6 - 1
        yield i * 6 + 1

def is_prime(p):
    if p < 2:
        return False
    for i in poss_primes():
        if i ** 2 > p:
            break
        if p % i == 0:
            return False
    return True

print(list(filter(naive_is_prime, range(2, 100))))
