function love.load ()
    width = 800
    height = 600
    centerX = width/2
    centerY = height/2

    ceil = 0

    shooter = { x=centerX,  y=500, w=100, h=100, vy=0, ay=1,onGround = false }
    ball = { x=50,  y=500, w=100, h=100, vy=0, ay=1,onGround = false }

    impulsed = false
    val = 0
    max = 100
    shooterGauge = 0
    shooterGaugeMax = 760
    shooterGaugeMin = 0
    gaugeWay = true

    gaugeBarH = 200

    love.window.setMode( width, height, {fullscreen=false, vsync=false, msaa=0} )
end