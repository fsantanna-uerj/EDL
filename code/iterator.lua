function loop ()
    for i=1, 10 do
        coroutine.yield(i, i*i)
    end
end

iterator = coroutine.wrap(loop)

for i,v in iterator do
    print(i,v)
end
