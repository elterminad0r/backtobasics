def palindrome(n):
    s = str(n)
    return s == s[::-1]

for pal in filter(palindrome, [a * b for a in range(100, 1000) for b in range(a, 1000)]):
    print(pal)
