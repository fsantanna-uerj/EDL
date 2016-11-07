function f1 ()
    local x = 10
    local function f2 ()
              local function f3 ()
                        return x
                    end
              return f3
          end
    return f2
end

print( f1()()() )
