require("Load")
require("Controls")
require("Phisics")
require("Debug")
require("Colliding")

collisions = 0
collided = false
ballSpeed = 6
launched = false
score = 0

gameOn = true
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
        
        for i=1, table.getn(bars) do
            bar = bars[i]
            if(bar.enabled) then
                love.graphics.rectangle("line",bar.x,bar.y,bar.width,bar.height)
            end
        end
    end


    love.graphics.printf("Voce fez " .. score .. " pontos", width - 100,height-100,200,"left")

    if(not gameOn) then 
        love.graphics.printf("GAME OVER", centerX,centerY,400,"left")
    end

    logMe()


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
        
function createBar()
    local barMinW = 20
    local barMaxW = 100
    local barH = 20
    
    local newBarW = 10 + (math.random() * (barMaxW - barMinW))
    local newBar = {
        x = 0 + math.random() * (width - barMaxW)
        , y = 0 + math.random() * height-barH
        , height = barH
        , width = newBarW
        , halfwidth = newBarW/2
        , halfheight = barH /2
        , enabled = true}
    table.insert(bars,newBar)
end











