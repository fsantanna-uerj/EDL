function love.load ()
    p1 = { x=50,  y=200, w=100, h=100, vx=30, ax=20 }
    p2 = { x=650, y=200, w=100, h=100 }
end

function love.keypressed (key)
    if key == 'left' then
        p2.x = p2.x - 10
    elseif key == 'right' then
        p2.x = p2.x + 10
    elseif key == 'up' then
        p2.y = p2.y - 10
    elseif key == 'down' then
        p2.y = p2.y + 10
    end
end

function collides (o1, o2)
    return (o1.x+o1.w >= o2.x) and (o1.x <= o2.x+o2.w) and
           (o1.y+o1.h >= o2.y) and (o1.y <= o2.y+o2.h)
end

function love.update (dt)
    p1.vx = p1.vx + p1.ax*dt
    p1.x  = p1.x  + p1.vx*dt

    if collides(p1, p2) then
        p1.x = p1.x - 30
        p2.x = p2.x + 30

        p1.vx = 30
    end
end

function love.draw ()
    love.graphics.rectangle('fill', p1.x,p1.y, p1.w,p1.h)
    love.graphics.rectangle('fill', p2.x,p2.y, p2.w,p2.h)
end
