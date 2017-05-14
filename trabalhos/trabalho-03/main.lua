require("Load")
require("Controls")
require("Phisics")
require("Debug")

collided = false
ballSpeed = 6
launched = false
function love.update (dt)
    gaugeAngle(dt)
    ball.x = ball.x + ball.velX * dt * ballSpeed
    ball.y = ball.y + ball.velY * dt * ballSpeed
end

function love.draw ()
    shooter.x = centerX + (shooter.radius * math.sin(angle * math.pi))
    shooter.y = height + (shooter.radius * math.cos(angle * math.pi))
    love.graphics.circle("fill",shooter.x,shooter.y,10)

    if(launched) then
        love.graphics.circle("fill",ball.x,ball.y,ball.radius)
        collided = collideBorders()
    end


    guideLines()
    logMe()
end

function launchBall()
    launched = not launched
    ball.x = shooter.x 
    ball.y = shooter.y 
    ball.velX = shooter.x  - centerX
    ball.velY = shooter.y - height 
end


function love.keypressed(key)
    if key == 'a' then
        launchBall()
    end
end

function collideBorders()
    if((ball.x + ball.radius > width) or (ball.x - ball.radius < 0)) then
        ball.velX = - ball.velX
        return true
    elseif((ball.y + ball.radius > height) or (ball.y - ball.radius < 0)) then
        ball.velY = - ball.velY
        return true
    end
    return false
end
        










