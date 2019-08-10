function counter (ini)
    local cur = 0
    return
        function ()
            cur = cur + 1
            return cur
        end
end

c1 = counter()
c2 = counter()
print(c1(), c2(), c1())
--print(counter,c1,c2)
