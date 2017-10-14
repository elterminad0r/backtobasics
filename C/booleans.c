#include <stdbool.h>
#include <stdio.h>

bool is_even(int n) {
    return (n & 1) == 0;
}

int main() {
    if (is_even(2))
        printf("2 is even\n");
    else
        printf("not even");

    printf("true is %d\n", true);
    return 0;
}
