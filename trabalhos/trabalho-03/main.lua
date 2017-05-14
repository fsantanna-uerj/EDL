require("Load")
require("Controls")
require("Phisics")
require("Debug")


impulsed = false
val = 0
max = 100
shooterGauge = 0
shooterGaugeMax = 760
shooterGaugeMin = 0
gaugeWay = true

gaugeBarH = 200

function love.update (dt)
    checkGround();
    gravity(dt);
    move(dt)    

    if (love.keyboard.isDown("a")  and shooter.onGround) then
        storeGauge(dt)
    end
    if love.keyboard.isDown("s") then
        -- unpressedKey()
        shooter.y = 499
        -- shooter.vy = shooterGauge
        shooter.ay = -shooterGauge
        shooterGauge = 0
    end
end

function love.draw ()
    --shooterDraw
    love.graphics.rectangle('fill', shooter.x,shooter.y, shooter.w,shooter.h)

    --GaugeDraw
    love.graphics.rectangle('line', 450,height-gaugeBarH,50,gaugeBarH)
    love.graphics.rectangle('fill', 450,height,50,-(gaugeBarH * shooterGauge / shooterGaugeMax))
    logMe()
end