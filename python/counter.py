"""
An illustration of collections.Counter
"""

from collections import Counter

# how do I count the words in this list?
l = "ASK NOT WHAT YOUR COUNTRY CAN DO FOR YOU BUT WHAT YOU CAN DO FOR YOUR COUNTRY".split()

c = Counter(l)

print(c)

for item, occurrences in c.most_common():
    print("{} occurs {} times".format(item, occurrences))
