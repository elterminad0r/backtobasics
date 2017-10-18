def main():
    print("{a}, {b}".format(a=1, b=2))

    x = 3
    y = 4

    pi = 3.14159265

    # python 3.6 only

    print("noice")
    print(f"{x}, {y}")
    print(f"x * y = {x * y}")
    print(f"big expression {'abcdefgh'[int(1 + 2 - 5 / 9)]}")
    print(f"two digs of pi {pi:.2f}")

    # old python (remember to use in function)
    # can't handle complex expressions
    print("old: {x}, {y}, {0}".format(x * y, **locals()))
    print("{:.2f}".format(pi))

    # fun format specifiers
    print("padded string: {:>10}".format("lena"))
    print("37 in binary: {:08b}".format(37))
    print("37 in hex: {:x}".format(37))

    # very old python
    print("very old: %d, %d" % (x, y))
    print("%.2f" % pi)

    print(locals())

if __name__ == "__main__":
    main()
