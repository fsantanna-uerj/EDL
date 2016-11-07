function f_coro ()
    for i=1, 10 do
        coroutine.yield(i, i*i)
    end
end

print'------------'
f_iter = coroutine.wrap(f_coro)
for i,v in f_iter do
    print(i,v)
end

print'------------'
f_iter = coroutine.wrap(f_coro)
for i,v in f_iter do
    print(i,v)
end
