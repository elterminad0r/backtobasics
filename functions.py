from math import pi, factorial as math_factorial

def get_area(r):
    return r ** 2 * pi

def get_rect_area(h, w):
    return h * w

def factorial(n):
    product = 1
    for i in range(1, n + 1):
        #product = product * i
        product *= i
    return product

def triangular_number(t):
    total = 0
    for i in range(1, t + 1):
        total += i
    return total

def closed_tri(t):
    return t * (t + 1) // 2

def fibo(n):
    #a = 0
    #b = 1
    a, b = 0, 1

    for _ in range(n):
        a, b = b, a + b

    return b

if __name__ == "__main__":
    for i in range(10):
        if factorial(i) != math_factorial(i):
            print("Aaaaaaaaargh")
        else:
            print("i is {}, Ti is {}, Fi is {}, MFi is {} fibo(i) is {}".format(
                    i,
                    triangular_number(i),
                    factorial(i),
                    math_factorial(i),
                    fibo(i)))
    
    #fac_val = int(input())
    print(factorial(10), math_factorial(10))

    print(get_area(1))
    print(get_area(3))

    for i in range(10, 20):
        print("area with r {} is {}".format(i, get_area(i)))
