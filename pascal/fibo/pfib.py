from sympy import sqrt, simplify

def fib(n):
    return simplify((((1 + sqrt(5)) / 2) ** n - ((1 - sqrt(5)) / 2) ** n) / sqrt(5))

for i in range(1, 21):
    print(i, fib(i))
