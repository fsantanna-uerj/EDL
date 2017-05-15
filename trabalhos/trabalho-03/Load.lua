function love.load ()
    width = 800
    height = 600
    centerX = width/2
    centerY = height/2

    angle = 0
    angleMax = 1.5
    angleMin = 0.5

    collisions = 0
    collided = false
    ballSpeed = 10
    launched = false
    score = 0

    gameOn = true

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
    createBars() 
end

function createBars()
    local barMinW = 20
    local barMaxW = 200
    local barH = 20
    local barN = 3 + math.floor(math.random() * 7)
    -- local barN = 1;
    for i=1, barN do
        local newBarW = 10 + (math.random() * (barMaxW - barMinW))
        local newBar = {
            x = 0 + math.random() * (width - barMaxW)
            , y =  10 + math.random() * height-barH - 100
            , height = barH
            , width = newBarW
            , halfwidth = newBarW/4
            , halfheight = barH /4
            , enabled = true}
        table.insert(bars,newBar)
    end
end