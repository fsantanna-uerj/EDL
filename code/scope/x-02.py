x = 1

def f():
    x = 2
    def g():
        #nonlocal x
        x = 3
        print("g ", x)
    g()
    print("f ", x)

f()

print("> ", x)
