import re
import readline

vowels = set("aeiou")

def piglatin(s):
    for ind, c in enumerate(s):
        if c in vowels:
            break
    return "{}{}ay".format(s[ind:], s[:ind])

def re_latin(s):
    return re.sub(r"([^aeiou]*)(.*)", r"\2\1ay", s)

def sentence_latin(sent):
    words = sent.split()

    output = [re_latin(word) for word in words]

#    lazy generator which is iterable
#    output = (re_latin(word) for word in words)

#    output = map(re_latin, words)

#    output = []
#    for word in words:
#        output.append(re_latin(word))

#   return " ".join([re_latin(word) for word in sent.split()])
#   return " ".join((re_latin(word) for word in sent.split()))
#   return " ".join(re_latin(word) for word in sent.split())
#   return " ".join(map(re_latin, sent.split()))

    return " ".join(output)

#while True:
#    word = input("Enter word > ").lower()
#    print(piglatin(word))
#    print(re_latin(word))

while True:
    sent = input("enter sentence > ")
    print(sentence_latin(sent))
