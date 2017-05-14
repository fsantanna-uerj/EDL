function love.load ()
    width = 800
    height = 600
    centerX = width/2
    centerY = height/2

    angle = 0
    angleMax = 1.5
    angleMin = 0.5

    ceil = 0

    bars = {}

    shooter ={x = 20,y = 20, radius = 60}

    ball = {x=0,y=0,velX = 0, velY = 0, radius = 10, halfheight = 10, halfwidth = 10}
    
    -- shooter = { x=50,  y=500, w=100, h=100, vy=0, ay=1,onGround = false }

    val = 0
    max = 100
    gaugeWay = true

    gaugeBarH = 200

    love.window.setMode( width, height, {fullscreen=false, vsync=false, msaa=0} )
end