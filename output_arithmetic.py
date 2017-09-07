"""
Basics of output and Python types
"""

print("Hello, World!")
print(1)
print(1 + 3)
print("1" + "3")

a = 5
print(a)

print("a is {}".format(a))

print() # empty line

# In Python3, be wary of this:
print(10 / 5)  # float division
print(10 // 5) # integer division

print()

# A useful operator is % (modulo). For positive integers, returns the remainder of division-
print(10 % 3)
print(203 % 50)
print(256 % 64)

print()

# if a is divisible by b, a % b will be 0
print(9 % 3 == 0)
print(10 % 5 == 0)
