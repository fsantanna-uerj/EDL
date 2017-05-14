require("Load")
require("Controls")
require("Phisics")
require("Debug")
angle = 0

function love.update (dt)
    checkGround();
    move(dt)    
    control(dt)
    if(not shooter.onGround) then
        angle = angle + dt
    end
end

function love.draw ()

    logMe()

    --GaugeDraw
    love.graphics.rectangle('line', 450,height-gaugeBarH,50,gaugeBarH)
    love.graphics.rectangle('fill', 450,height,50,-(gaugeBarH * shooterGauge / shooterGaugeMax))

    if(not shooter.onGround) then
        love.graphics.translate(shooter.x,shooter.y) -- move relative (0,0) to (x,y)
        -- love.graphics.translate(centerX,centerY) -- move relative (0,0) to (x,y)
        love.graphics.rotate(angle) -- rotate coordinate system around relative (0,0) (absolute (x,y))
        love.graphics.rectangle('fill', 0,-0, shooter.w,shooter.h)
        -- guideLines()
    else
        love.graphics.rectangle('fill', shooter.x,shooter.y, shooter.w,shooter.h)
    end
        guideLines()

    --shooterDraw
end
