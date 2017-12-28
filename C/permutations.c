#include <stdio.h>
#include <stdlib.h>

typedef void (*action_func)(char **items, int len);

void print_arr(char **arr, int len) {
    for (int i = 0; i < len - 1; i++) {
        printf("%s ", arr[i]);
    }
    printf("%s\n", arr[len - 1]);
}

void swap(char **a, char **b) {
    char *t = *a;
    *a = *b;
    *b = t;
}

void _permutations(char **arr, char **o_arr, action_func action, int len, int o_len) {
    if (len == 0) {
        action(o_arr, o_len);
    } else {
        for (int i = 0; i < len; i++) {
            swap(&arr[0], &arr[i]);
            _permutations(arr + 1, o_arr, action, len - 1, o_len);
            swap(&arr[0], &arr[i]);
        }
    }
}

void permutations(char **arr, action_func action, int len, int n) {
    _permutations(arr, arr, action, len, len);
}

int main(int argc, char **argv) {
    permutations(argv + 1, print_arr, argc - 1, 3);
}
