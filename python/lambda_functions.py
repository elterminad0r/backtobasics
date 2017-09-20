"""
Lambda functions in Python. A lambda function is another way to make a function
- however it doesn't have to have a name, so it's often called an anonymous
function. They can be useful if another function wants a function but you don't
want to define a whole function using def. Lambda functions are made using
"lambda <args>: <expr involving args>". An example might help:
"""

def apply_func(func, val):
    print("f({}) is {}".format(val, func(val)))

print(apply_func(lambda x: x ** 2, 9))
