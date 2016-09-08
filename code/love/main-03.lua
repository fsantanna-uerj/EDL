function love.load ()
    x = 50
    y = 200
end

function love.keypressed (key)
    if key == 'left' then
        x = x - 10
    elseif key == 'right' then
        x = x + 10
    elseif key == 'up' then
        y = y - 10
    elseif key == 'down' then
        y = y + 10
    end
end

function love.draw ()
    love.graphics.rectangle('fill', x,y, 100,100)
end
