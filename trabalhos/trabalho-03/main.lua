require("Load")
require("Controls")
require("Phisics")
require("Debug")

shooter ={}
shooter.height = 20
shooter.width = 20
angle = 0
angleMax = 1.5
angleMin = 0.5
r = 60
function love.update (dt)
    gaugeAngle(dt)
end

function love.draw ()
    myX = centerX + (r * math.sin(angle * math.pi))
    myY = height + (r * math.cos(angle * math.pi))
    -- love.graphics.polygon("fill",centerX,height,centerX-shooter.width,height-shooter.height,centerX+shooter.width,height-shooter.height)
    love.graphics.circle("fill",myX,myY,10)
    guideLines()
    logMe()
end
