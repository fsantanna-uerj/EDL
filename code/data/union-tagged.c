#include <stdio.h>

typedef struct flexType {
    char  is_int;
    union {
        int   i;
        float f;
    };
} Flex;

int main (void) {
    Flex F;
    F.i = 999999999;
    F.is_int = 1;
    if (F.is_int) {
        printf(">>> %d\n", F.i);
    } else {
        printf(">>> %f\n", F.f);
    }
    return 0;
}
