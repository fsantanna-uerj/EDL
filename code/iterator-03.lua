function loop ()
    for i=1, 10 do
        coroutine.yield(i, i*i)
    end
end

f_iter = coroutine.wrap(loop)

for i,v in f_iter do
    print(i,v)
end
