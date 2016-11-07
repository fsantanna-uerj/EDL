function f (v1)
    local X, Y = 100, 100
    print(X,Y)
    for x=X+1, X+10 do
        X = x
        print(X,Y)
    end
    for y=Y+1, Y+10 do
        Y = y
        print(X,Y)
    end
    for x=X-1, X-10, -1 do
        X = x
        print(X,Y)
    end
    for y=Y-1, Y-10, -1 do
        Y = y
        print(X,Y)
    end
end

f()
