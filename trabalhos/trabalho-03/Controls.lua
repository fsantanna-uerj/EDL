alreadyImpulsed = false
function control(dt)
    if (love.keyboard.isDown("a")  and shooter.onGround) then
        -- alreadyImpulsed = false
        storeGauge(dt)
    end
    
    if(love.keyboard.isDown("s")) then
        alreadyImpulsed = true
        shooter.y = 499
        shooter.ay = -shooterGauge
        shooterGauge = 0
    end
end

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