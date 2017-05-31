function new (x,y)
    local me = {
        move = function (dx,dy)
            x = x + dx
            y = y + dy
            return x, y
        end,
        get = function ()
            return x, y
        end,
    }
    return me
end

local o1 = new(0,  290)
local o2 = new(780,290)

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
