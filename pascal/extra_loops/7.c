#include <stdio.h>

int is_perf(int n) {
    for (int i = 0; i < n; i++) {
        if (i * i == n) {
            return 1;
        }
        if (i * i > n) {
            break;
        }
    }
    return 0;
}

int main() {
    int count = 0;
    int total = 0;
    int i = 0;
    while (count < 5) {
        i += 1;
        total += i;
        if (is_perf(total)) {
            printf("%d\n", total);
            count += 1;
        }
    }
}
