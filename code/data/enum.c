#include <stdio.h>

typedef enum {
    Seg,
    Ter,
    Qua,
    Qui,
    Sex,
    Sab,
    Dom,
} Dias;

int main (void) {
    Dias hoje = Sex;
    printf(">>> %d\n", hoje);
    hoje = 1;
    printf(">>> %d\n", hoje);
    return 0;
}
