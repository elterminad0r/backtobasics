#include <stdio.h>

int main() {
    char a  = 'A';
    char a_ = "A"[0];
    printf("'A' has ascii value %d (alternatively %d)\n", a, a_);
    return 0;
}

// compiled with $ gcc -Wall -pedantic -std=c99 -o bin/print_charval print_charval.c
