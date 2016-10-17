function new (o)
  return {
    move = function (dx,dy)
             o.x = o.x + dx
             o.y = o.y + dy
             return o.x, o.y
           end,
    get = function ()
             return o.x, o.y
          end,
  }
end

local o1 = new{x=0,  y=290}
local o2 = new{x=780,y=290}

function love.update (dt)
    o1.move( 100*dt, 0)
    o2.move(-100*dt, 0)
end

function love.draw ()
    local x,y = o1.get()
    love.graphics.rectangle('fill', x,y, 20,20)

    local x,y = o2.get()
    love.graphics.rectangle('fill', x,y, 20,20)
end
