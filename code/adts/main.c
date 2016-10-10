#include <stdio.h>
#include "stack.h"

int main (void) {
    Stack* stk = create();
    printf(">>> empty=%d\n", empty(stk));
    return 0;
}
