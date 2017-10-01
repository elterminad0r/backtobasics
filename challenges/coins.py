#!/bin/python3

import sys

def getWays(n, c):
    memo = {(0, c[i:]): 1 for i in range(len(c))}
    for i in range(1, n + 1):
        for j in range(len(c)):
            coins = c[j:]
            #print(memo)
            #print(i, coins)
            memo[(i, coins)] = sum(memo[(i - coin, coins[ind:])] for ind, coin in enumerate(coins) if i - coin >= 0)
    return memo[(n, c)]
            

n, m = input().strip().split(' ')
n, m = [int(n), int(m)]
c = list(map(int, input().strip().split(' ')))
# Print the number of ways of making change for 'n' units using coins having the values given by 'c'
ways = getWays(n, tuple(reversed(sorted(c))))
print(ways)
