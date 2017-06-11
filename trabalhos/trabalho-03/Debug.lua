function logMe()
    logs = {
        {"Angle: " .. angle}
        , {"BallX: " .. ball.x}
        , {"BallY: " .. ball.y}
        , {"OBJ X: " .. globalOBJ.x}
        , {"OBJ Y: " .. globalOBJ.y}
    }
    log2(logs)
end

function log2(args)
    for i=1, table.getn(args) do
        love.graphics.printf(args[i], width-200,height-(i*30),200,"left")
    end
end

function boolToString(boolean)
    if(boolean) then
        return  "true"
    else
        return "false"
    end
end


