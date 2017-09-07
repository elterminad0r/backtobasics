"""
Functions in Python - what they do, how to use them, some examples.
"""

#fibonacci function - see multiple assignment
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
