from math import pi, factorial as math_factorial

#area of circle
def get_area(r):
    return r ** 2 * pi

#area of rectangle (see 2 arguments)
def get_rect_area(h, w):
    return h * w

#factorial
def factorial(n):
    product = 1
    for i in range(1, n + 1):
        #product = product * i
        product *= i
    return product

#triangular number
def triangular_number(t):
    total = 0
    for i in range(1, t + 1):
        total += i
    return total

#closed form of triangular number
def closed_tri(t):
    return t * (t + 1) // 2
