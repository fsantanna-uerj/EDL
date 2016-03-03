local cur = 0

function inc ()
    cur = cur + 1
    return cur
end

print(inc(), inc(), inc())
