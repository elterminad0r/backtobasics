import re

def is_email(s):
    """Check if a '.' occurs after an '@'"""
    has_found_at = False
    has_found_dot = False
    for c in s:
        if c == "@":
            has_found_at = True
        if has_found_at and c == ".":
            has_found_dot = True
    return has_found_dot

def re_email(s):
    return re.search(r"@.*\.", s)

def full_re(s):
    return re.match(r"^[^@ ]+@[^@ ]+\.[^@ ]+$", s)

while True:
    em = input()

    for validator in is_email, re_email, full_re:

        print(validator.__name__, end=" ")
        if validator(em):
            print("valid")
        else:
            print("invalid")
