require("Load")
require("Controls")
require("Phisics")
require("Debug")
require("Colliding")


function love.update (dt)
    if (gameOn) then
        gaugeAngle(dt)
        ball.x = ball.x + ball.velX * dt * ballSpeed
        ball.y = ball.y + ball.velY * dt * ballSpeed
        if (launched) then
            collided = collideBorders()
            collideBarsAndScore()
        end
    end
end

function love.draw ()
    shooter.x = centerX + (shooter.radius * math.sin(angle * math.pi))
    shooter.y = height + (shooter.radius * math.cos(angle * math.pi))
    love.graphics.circle("fill",shooter.x,shooter.y,10)

    if(launched) then
        love.graphics.circle("fill",ball.x,ball.y,ball.radius)
    end

    for i=1, table.getn(bars) do
        bar = bars[i]
        if(bar.enabled) then
            love.graphics.rectangle("line",bar.x,bar.y,bar.width,bar.height)
        end
    end


    love.graphics.printf("Voce fez " .. score .. " pontos", width - 200,height-100,200,"left")

    if(not gameOn) then 
        love.graphics.printf("GAME OVER", centerX-100,centerY,400,"left")
        love.graphics.printf("VOCÊ FEZ " .. score .. " PONTOS", centerX-100,centerY + 50,400,"left")
        love.graphics.printf("APERTE R PARA RECOMEÇAR", centerX-100,centerY + 100,400,"left")
    end

    -- logMe()


end

function invertMovement(axis)
    if (axis == "y") then
        ball.velY = - ball.velY * 1.001
    elseif(axis == "x") then
        ball.velX = - ball.velX * 1.001
    end
end

function collideBarsAndScore()
    local myScore = 0
    for i = 1, table.getn(bars) do
        bar = bars[i]
        if (bar.enabled) then
            if (collidingForTwoRectangles(bar)) then
                collisions =  collisions + 1
                bar.enabled = false
            end
        else
            myScore = myScore + 1
        end
    end
    score = myScore * 10;
end
        












