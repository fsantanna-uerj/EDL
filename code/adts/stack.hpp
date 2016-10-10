class Stack {
    public:
        Stack();
        ~Stack();
        int  empty (void);
        void push (int);
        void pop (void);
        int  top (void);
    private:
        int* stackPtr;
        int  maxLen;
        int  topSub;
};
