function counter (ini)
    local cur = ini or 0
    return
        function ()
            cur = cur + 1
            return cur
        end
end

c1 = counter()
c2 = counter(10)
print(c1(), c2(), c1())
