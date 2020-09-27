x = 1

def f():
    #global x
    x = 2
    print("dentro ", x)

f()

print("fora ", x)
