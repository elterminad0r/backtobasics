import dis

def f():
    for i in range(10):
        print(i in [1, 4, 9])

def g():
    sq = [1, 4, 9]
    for i in range(10):
        print(i in sq)

print("Here is f:")
dis.dis(f)
print("Here is g:")
dis.dis(g)
