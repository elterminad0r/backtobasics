#include <stdio.h>
#include <stdlib.h>

typedef void (*action_func)(char **items, int len);

void print_arr(char **arr, int len) {
    for (int i = 0; i < len - 1; i++) {
        printf("%s ", arr[i]);
    }
    printf("%s\n", arr[len - 1]);
}

void _combinations(char **arr, char **o_acc, char **acc, action_func action, int len, int o_n, int n) {
    if (n == 0) {
        action(o_acc, o_n);
    } else {
        acc[0] = arr[0];
        _combinations(arr + 1, o_acc, acc + 1, action, len - 1, o_n, n - 1);
        if (n != len) {
            _combinations(arr + 1, o_acc, acc, action, len - 1, o_n, n);
        }
    }
}

void combinations(char **arr, action_func action, int len, int n) {
    char **acc = malloc(sizeof(char*) * n);
    _combinations(arr, acc, acc, action, len, n, n);
}

int main(int argc, char **argv) {
    combinations(argv + 1, print_arr, argc - 1, 3);
}
