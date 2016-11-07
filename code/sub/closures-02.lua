function new (x,y)
  return {
    move = function (dx,dy)
             x = x + dx
             y = y + dy
             return x, y
           end
  }
end

local o1 = new(0,0)
local o2 = new(100,100)
print( o1.move(10,10) )
print( o2.move(20,20) )
print( o1.move(-5,-5) )
print( o2.move(-5,-5) )
