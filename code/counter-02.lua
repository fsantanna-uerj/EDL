local cur1 = 0
function inc1 ()
    cur1 = cur1 + 1
    return cur1
end

local cur2 = 0
function inc2 ()
    cur2 = cur2 + 1
    return cur2
end

print(inc1(), inc2(), inc2(), inc1())
