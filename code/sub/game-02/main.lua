function new (x,y,vx)
    local me; me = {
        move = function (dx,dy)
             x = x + dx
             y = y + dy
             return x, y
        end,
        get = function ()
             return x, y
        end,
        co = coroutine.create(function (dt)
            while true do
                me.move( vx*dt, 0)
                dt = coroutine.yield()
            end
        end),
    }
    return me
end

local o1 = new(0,  290,  100)
local o2 = new(780,290, -100)

function love.update (dt)
    coroutine.resume(o1.co, dt)
    coroutine.resume(o2.co, dt)
end

function love.draw ()
    local x,y = o1.get()
    love.graphics.rectangle('fill', x,y, 20,20)

    local x,y = o2.get()
    love.graphics.rectangle('fill', x,y, 20,20)
end
