#include <stdio.h>

int inv (void) {
    static int v = 0;
    //int v = 0;
    v = !v;
    return v;
}

int main (void) {
    printf("inv = %d\n", inv());
    printf("inv = %d\n", inv());
    printf("inv = %d\n", inv());
    printf("inv = %d\n", inv());
    printf("inv = %d\n", inv());
    return 0;
}
