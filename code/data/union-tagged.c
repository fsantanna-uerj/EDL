#include <stdio.h>

typedef struct flexType {
    char  isint;
    union {
        int   i;
        float f;
    };
} Flex;

int main (void) {
    Flex F;
    F.i = 999999999;
    F.isint = 1;
    if (F.isint) {
        printf(">>> %d\n", F.i);
    } else {
        printf(">>> %f\n", F.f);
    }
    return 0;
}
