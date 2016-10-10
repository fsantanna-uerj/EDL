#include <stdio.h>
#include "stack.hpp"

int main (void) {
    Stack stk;
    stk.push(42);
    stk.push(17);
    int v1 = stk.top();
    stk.pop();
    int v2 = stk.top();
    stk.pop();
    printf(">>> v1=%d v=%d empty=%d\n", v1, v2, stk.empty());
    //printf(">>> %d\n", stk.maxLen);
    return 0;
}
