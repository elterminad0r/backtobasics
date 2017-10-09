import re

vowels = set("aeiou")

def piglatin(s):
    for ind, c in enumerate(s):
        if c in vowels:
            break
    return "{}{}ay".format(s[ind:], s[:ind])

def re_latin(s):
    return re.sub(r"([^aeiou]*)(.*)", r"\2\1ay", s)

while True:
    word = input("Enter word > ").lower()
    print(piglatin(word))
    print(re_latin(word))
