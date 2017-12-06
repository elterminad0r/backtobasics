#include <stdio.h>

void ascii(char w[]) {
    for (int c = 0; w[c] != '\0'; c++)
        printf("%d ", w[c]);
    printf("\n");
}

int main(int argc, char **argv) {
    for (int i = 1; i < argc; i++) {
        ascii(argv[i]);
    }
    return 0;
}
