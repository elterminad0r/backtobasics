#include<stdio.h>
#include<string.h>

int caesar(int shift) {
    for (char c = getchar(); c != EOF; c = getchar()) {
        char strip_c = c & (0xFF - 32);
        if (('A' <= strip_c) && (strip_c <= 'Z')) {
            printf("%c", (strip_c - 'A' + shift) % 26 + 'A');
        } else {
            printf("%c", c);
        }
    }
    return 0;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Requires argv");
        return 1;
    }

    int shift;

    sscanf(argv[1], "%d", &shift);

    return caesar(shift);
}
