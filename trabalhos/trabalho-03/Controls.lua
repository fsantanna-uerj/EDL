function gaugeAngle(dt)
    angleVel = 1
    if(gaugeWay) then
        angle = angle + (dt * angleVel)
    else
        angle = angle - (dt * angleVel)
    end

    if(angle > angleMax) then
        angle = angleMax
        gaugeWay = false
    elseif (angle < angleMin) then
        angle = angleMin
        gaugeWay = true
    end
end


function love.keypressed(key)

    if(gameOn) then
        if key == 'a' then
            launched = not launched
            ball.x = shooter.x 
            ball.y = shooter.y 
            ball.velX = shooter.x  - centerX
            ball.velY = shooter.y - height 
        end
    else
        if (key == 'r') then 
            love.load()
        end
    end
end