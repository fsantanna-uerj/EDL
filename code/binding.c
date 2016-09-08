#include <stdio.h>
#include <math.h>

#define PI 3.14

static char* frase = "Ola Mundo!";

int f (void);

int main (void) {
    printf("%s\n", frase);
    int x = 2 * sin(PI) + f();
    return x;
}
