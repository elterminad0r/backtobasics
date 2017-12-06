import sys

def ascii(w):
    return " ".join(str(ord(c)) for c in w)

if __name__ == "__main__":
    for w in sys.argv[1:]:
        print(ascii(w))
