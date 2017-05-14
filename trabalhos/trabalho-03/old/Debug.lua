function logMe()
    groundLogger = false
    if(shooter.onGround) then
        groundLogger = "true"
    else
        groundLogger = "false"
    end

    logs = {
        {"accel: " .. shooter.ay}
        , {"vel: " .. shooter.vy}
        , {"pos: " .. shooter.y}
        , {"val: " .. val}
        , {"onground: " .. groundLogger}
        , {"ShooterGauge: " .. shooterGauge}
        , {"Angle: " .. angle}
    }

    
    log2(logs)
end

function log2(args)
    for i=1, table.getn(args) do
        love.graphics.printf(args[i], width-200,height-(i*40),200,"left")
    end
end

function guideLines()
    love.graphics.printf("y",5,40,200,"left")
    love.graphics.line(5,5,5,height - 5)
    love.graphics.printf("x",40,5,200,"left")
    love.graphics.line(5,5,width,5)
end




