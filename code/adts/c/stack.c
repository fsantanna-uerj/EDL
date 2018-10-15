#include "stack.h"
#include <stdlib.h>

struct Stack {
    int vs[100];
    int top;
};

Stack* create (void) {
    return (Stack*) malloc(sizeof(Stack));
}

int empty (Stack* stack) {
    return (stack->top == 0);
}

// TODO
void push (Stack* stack, int v) {}
void pop  (Stack* stack)        {}
int  top  (Stack* stack)        { return 0; }
