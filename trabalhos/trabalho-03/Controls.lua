
function love.keypressed (key)
    if (key == "a" and shooter.onGround ) then
        impulse(val)  
        val = 0
    end
end

function unpressedKey(key)
    if (key == "a" and shooter.onGround) then
        impulse(val)  
        val = val+1
    end
end

function storeGauge(dt)

    if(gaugeWay) then
        shooterGauge = shooterGauge + (dt * 500)
    else
        shooterGauge = shooterGauge - (dt * 500)
    end

    if(shooterGauge > shooterGaugeMax) then
        shooterGauge = shooterGaugeMax
        gaugeWay = false
    elseif (shooterGauge < shooterGaugeMin) then
        shooterGauge = shooterGaugeMin
        gaugeWay = true
    end
end