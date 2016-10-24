function c_iter ()
    local i = 0
    return
        function ()
            if i == 10 then
                return nil
            end
            i = i + 1
            return i, i*i
        end
end

print'------------'
local f_iter = c_iter()
for i,v in f_iter do
    print(i,v)
end

print'------------'
local f_iter = c_iter()
for i,v in f_iter do
    print(i,v)
end

--[[
print'------------'
for i,v in c_iter() do
    print(i,v)
end
]]
