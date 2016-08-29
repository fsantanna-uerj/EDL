function f_coro ()
    coroutine.yield( 1,  1*1 )
    coroutine.yield( 2,  2*2 )
    coroutine.yield( 3,  3*3 )
    coroutine.yield( 4,  4*4 )
    coroutine.yield( 5,  5*5 )
    coroutine.yield( 6,  6*6 )
    coroutine.yield( 7,  7*7 )
    coroutine.yield( 8,  8*8 )
    coroutine.yield( 9,  9*9 )
    coroutine.yield(10, 10*10)
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

--[[
print'------------'
for i,v in f_iter do
    print(i,v)
end
]]


--[[
print'------------'
f_iter = coroutine.wrap(f_coro)
for i,v in f_iter do
    print(i,v)
end
]]

