from collections import Counter

master = "1234"
guess = "3214"

def correct_digits(master, guess):
    # a set is a unique collection which supports fast membership testing.
    # >>> {1, 2, 3}
    # {1, 2, 3}
    # >>> [1, 2, 3]
    # [1, 2, 3]
    # >>> {1, 2, 3, 2}
    # {1, 2, 3}
    # >>> set([1, 2, 3]) == {1, 2, 3}

    # the Counter counts how many of each element there is
    # In [3]: Counter("4444")
    # Out[3]: Counter({'4': 4})
    # 
    # In [4]: Counter("0112")
    # Out[4]: Counter({'1': 2, '0': 1, '2': 1})
    # 
    # In [5]: Counter("01101110")
    # Out[5]: Counter({'1': 5, '0': 3})

    # In [2]: a = Counter("01110")

    # In [3]: a
    # Out[3]: Counter({'1': 3, '0': 2})
    # 
    # In [4]: a['0']
    # Out[4]: 2
    # 
    # In [5]: a['2']
    # Out[5]: 0

    master_set = Counter(master)

    in_place = 0
    correct = 0

    # enumerate means we don't have to do guess[i] - it tracks both items and
    # their positions.
    # >>> list(enumerate(["a", "b", "c"]))
    # [(0, 'a'), (1, 'b'), (2, 'c')]


    # zip zips two lists together - it lets you iterate in parallel
    # >>> list(zip("abc", "def"))
    # [('a', 'd'), ('b', 'e'), ('c', 'f')]

    # unpacking!! :D
    # >>> ind, (digit, mst_digit) = (0, ('a', 'd'))
    # >>> ind
    # 0
    # >>> digit
    # 'a'
    # >>> mst_digit
    # 'd'

    for ind, (digit, mst_digit) in enumerate(zip(guess, master)):
        # if there are digits left
        if master_set[digit] > 0:
            # cross one off
            master_set[digit] -= 1

            # add another one that was correct
            correct += 1

        # if the zipped guess-master digits are equal
        if digit == mst_digit:
            # add an in place correct value
            in_place += 1

    return correct, in_place

correct, in_place = correct_digits(master, guess)

print("{} digits were correct".format(correct))
print("{} digits were exactly correct".format(in_place))

print("{} should be 1".format(correct_digits("4111", "4444")[0]))

print("{} should be 2".format(correct_digits("4411", "4433")[0]))
