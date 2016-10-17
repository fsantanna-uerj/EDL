function f1 ()
    local x = 10
    local function f2 ()
              return x
          end
    return f2
end

local f = f1()
print( f() )
