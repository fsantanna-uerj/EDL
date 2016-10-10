#include "stack.hpp"

Stack::Stack () {
    stackPtr = new int [100];
    maxLen = 99;
    topSub = -1;
}

Stack::~Stack () {
    delete [] stackPtr;
};

void Stack::push (int number) {
    if (topSub <= maxLen) {
        stackPtr[++topSub] = number;
    }
}

void Stack::pop (void) {
    if (topSub >= 0) {
        topSub--;
    }
}

int Stack::top (void) {
    if (topSub >= 0) {
        return (stackPtr[topSub]);
    }
}

int Stack::empty (void) {
    return (topSub == -1);
}
