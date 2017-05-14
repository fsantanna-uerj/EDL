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

function storeGauge(dt)
    mult = 1000
    if(gaugeWay) then
        shooterGauge = shooterGauge + (dt * mult)
    else
        shooterGauge = shooterGauge - (dt * mult)
    end

    if(shooterGauge > shooterGaugeMax) then
        shooterGauge = shooterGaugeMax
        gaugeWay = false
    elseif (shooterGauge < shooterGaugeMin) then
        shooterGauge = shooterGaugeMin
        gaugeWay = true
    end
end