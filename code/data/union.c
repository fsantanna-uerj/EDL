#include <stdio.h>

typedef union flexType {
    int   i;
    float f;
} Flex;

int main (void) {
    Flex F;
    F.i = 999999999;
    printf(">>> %f\n", F.f);
    return 0;
}
