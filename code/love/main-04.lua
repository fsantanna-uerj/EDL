function love.load ()
    p1 = { x=50,  y=200 }
    p2 = { x=650, y=200 }
end

function love.keypressed (key)
    if key == 'a' then
        p1.x = p1.x - 10
    elseif key == 'd' then
        p1.x = p1.x + 10
    elseif key == 'w' then
        p1.y = p1.y - 10
    elseif key == 's' then
        p1.y = p1.y + 10
    end

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

function love.draw ()
    love.graphics.rectangle('fill', p1.x,p1.y, 100,100)
    love.graphics.rectangle('fill', p2.x,p2.y, 100,100)
end
