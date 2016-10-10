typedef struct Stack Stack;
Stack* create (void);
int    empty  (Stack*);
void   push   (Stack*, int);
void   pop    (Stack*);
int    top    (Stack*);
