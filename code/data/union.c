#include <stdio.h>

typedef union flexType {
    int   i;
    float f;
    int   v[1000];
} Flex;

int main (void) {
    Flex F;
    F.i = 999999999;
    printf(">>> %f %ld\n", F.f, sizeof(F));
    return 0;
}
