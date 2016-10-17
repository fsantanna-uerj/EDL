function new (o)
  return {
    move = function (dx,dy)
             o.x = o.x + dx
             o.y = o.y + dy
             return o.x, o.y
           end
  }
end

local o1 = new{x=0,y=0}
local o2 = new{x=100,y=100}
print( o1.move(10,10) )
print( o2.move(20,20) )
print( o1.move(-5,-5) )
print( o2.move(-5,-5) )
