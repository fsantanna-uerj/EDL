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
    }

    
    log2(logs)
end

function log2(args)
    for i=1, table.getn(args) do
        love.graphics.printf(args[i], width-200,height-(i*40),200,"left")
    end
end





