local i = 0
function f_iter ()
    if i == 10 then
        return nil
    end
    i = i + 1
    return i, i*i
end

print'------------'
for i,v in f_iter do
    print(i,v)
end

print'------------'
for i,v in f_iter do
    print(i,v)
end

--[[
print'------------'
for i,v in f_iter do
    print(i,v)
end
]]
