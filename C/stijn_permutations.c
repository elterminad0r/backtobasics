#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef void (*action_func)(void *items, int len);

void print_char_arr(void *arr, int len) {
    char* a = arr;
    printf("%*s\n", len, a);
}

void print_string_arr(void *arr, int len) {
    char** a = arr;
    int i;
    for (i = 0; i < len; i++) {
       printf(" %s", a[i]);
    }
    putchar('\n');
}

void print_int_arr(void *arr, int len) {
    int* a = arr;
    int i;
    for (i = 0; i < len; i++) {
       printf(" %d", a[i]);
    }
    putchar('\n');
}

void print_dbl_arr(void *arr, int len) {
    double* a = arr;
    int i;
    for (i = 0; i < len; i++) {
       printf(" %.4g", a[i]);
    }
    putchar('\n');
}

               // WARNING HARD LIMIT
void swap(char *a, char *b, unsigned elem_size) {
    char tmp[64];
    memcpy(tmp, a, elem_size);
    memcpy(a, b, elem_size);
    memcpy(b, tmp, elem_size);
}

void _permutations(void *arr_v, void *orig_arr, action_func action, int len, int orig_len, unsigned elem_size) {
    char* arr = arr_v;
    if (len == 0) {
        action(orig_arr, orig_len);
    } else {
        for (int i = 0; i < len; i++) {
            swap(arr+0, arr+i*elem_size, elem_size);
            _permutations(arr + elem_size, orig_arr, action, len - 1, orig_len, elem_size);
            swap(arr+0, arr+i*elem_size, elem_size);
        }
    }
}

void permutations(void *arr, action_func action, int len, unsigned elem_size) {
    _permutations(arr, arr, action, len, len, elem_size);
}


int main(int argc, char **argv) {
    int mode = argc > 1 ? argv[1][0] : 'h';         // elp
    int myints[10], i;
    double mydbls[10];

    switch (mode) {
       case 'c':
       permutations(argv[2], print_char_arr, strlen(argv[2]), 1);
       break;

       case 's':
       permutations(argv+2, print_string_arr, argc-2, sizeof(argv[0]));
       break;

       case 'i':
       for (i=0; i<argc-2 && i<10; i++) {
         myints[i] = atoi(argv[i+2]);
       }
       permutations(myints, print_int_arr, i, sizeof(myints[0]));
       break;

       case 'd':
       for (i=0; i<argc-2 && i<10; i++) {
         mydbls[i] = atof(argv[i+2]);
       }
       permutations(mydbls, print_dbl_arr, i, sizeof(mydbls[0]));
       break;

       default:
       fprintf(stderr, "Usage: perm [csi] items   (c=character, s=string, i=integer items)\n");
    }
}
