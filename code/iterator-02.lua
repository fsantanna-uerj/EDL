function iterator ()
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

for i,v in iterator() do
    print(i,v)
end
