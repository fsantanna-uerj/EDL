function logMe()
    logs = {
        {"Angle: " .. angle}
        , {"Shooter X: " .. shooter.x}
        , {"Shooter y: " .. shooter.y}
        , {"Launched: " .. boolToString(launched)}
        , {"BallVelX: " .. ball.velX}
        , {"BallVelY: " .. ball.velY}
        , {"BallX: " .. ball.x}
        , {"BallY: " .. ball.y}
        , {"collided: " .. boolToString(collided)}
    }
    log2(logs)
end

function log2(args)
    for i=1, table.getn(args) do
        love.graphics.printf(args[i], width-200,height-(i*30),200,"left")
    end
end

function guideLines()

    love.graphics.line(5,5,5,height - 5)
    love.graphics.line(5,5,width,5)
    -- love.graphics.rotate(math.pi)
    love.graphics.printf("eixo Y",5,40,200,"left")
    love.graphics.printf("eixo X",40,5,200,"left")
end

function boolToString(boolean)
    if(boolean) then
        return  "true"
    else
        return "false"
    end
end


