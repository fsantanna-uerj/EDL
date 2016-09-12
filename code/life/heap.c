#include <stdlib.h>
#include <stdio.h>

int main (void) {
    int *v1, *v2;
    v1 = (int*) malloc(sizeof(int));
    v2 = (int*) malloc(sizeof(int));

    *v1 = 10;
    *v2 = 100;

    v1 = v2;

    free(v2);

    printf(">>> v1=%d v2=%d\n", *v1, *v2);

    return 0;
}
