"""
Some illustration of triple-quoted strings. This string is itself a docstring
"""

def f():
    """
    This is a function and this can be accessed via help
    """
    print("f was called")

    """
    print(this won't happen)
    """

if __name__ == "__main__":
    a = """kijk is aan
    wat is dit lang"""

    print(a)
