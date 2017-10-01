def square_sum(n):
    return n * (2 * n + 1) * (n + 1) // 6
def linear_sum(n):
    return n * (n + 1) // 2
def grid_sum(n):
    return 16 * square_sum(n) - 28 * linear_sum(n) + 16 * n - 3

print(4 * square_sum(3) - 6 * linear_sum(3) + 3 * 3, 1 + 7 + 21)
print(linear_sum(5), sum(i for i in range(6)))
