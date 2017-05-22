--[[
Nome: palavra reservada "function"
Propriedade: semântica
Binding time: design time
Explicacao: define um bloco de código que tem seu próprio escopo e variáveis, mas que também pode usar as variáveis
de níveis acima do seu
]]

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

--[[
Nome: palavra reservada "local"
Propriedade: semântica
Binding time: design time
Explicacao: define uma variável que tem seu acesso condedido somente ao bloco de código onde está declarada e inferiores
]]
    local barMinW = 20
    local barMaxW = 200
    local barH = 20
--[[
Nome: math.random()
Propriedade: valor
Binding time: runtime
Explicacao: seu valor é definido aleatóriamente em tempo de execução
]]
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

function love.update (dt)
--[[
Nome: parâmetro 'dt'
Propriedade: Endereço
Binding time: runtime
Explicacao: dt é uma variável local da funcão love.update, sendo definida a cada chamada desta função
]]
    if (gameOn) then
        gaugeAngle(dt)
        ball.x = ball.x + ball.velX * dt * ballSpeed
        ball.y = ball.y + ball.velY * dt * ballSpeed
        if (launched) then
            collided = collideBorders()
            collideBarsAndScore()
        end
    end
end

function love.draw ()
    shooter.x = centerX + (shooter.radius * math.sin(angle * math.pi))
    shooter.y = height + (shooter.radius * math.cos(angle * math.pi))
    love.graphics.circle("fill",shooter.x,shooter.y,10)

    if(launched) then
        love.graphics.circle("fill",ball.x,ball.y,ball.radius)
    end

    for i=1, table.getn(bars) do
        bar = bars[i]
        if(bar.enabled) then
            love.graphics.rectangle("line",bar.x,bar.y,bar.width,bar.height)
        end
    end


    love.graphics.printf("Voce fez " .. score .. " pontos", width - 200,height-100,200,"left")

    if(not gameOn) then 
        love.graphics.printf("GAME OVER", centerX-100,centerY,400,"left")
        love.graphics.printf("VOCÊ FEZ " .. score .. " PONTOS", centerX-100,centerY + 50,400,"left")
        love.graphics.printf("APERTE R PARA RECOMEÇAR", centerX-100,centerY + 100,400,"left")
    end

    -- logMe()


end

function invertMovement(axis)
    if (axis == "y") then
        ball.velY = - ball.velY * 1.001
    elseif(axis == "x") then
        ball.velX = - ball.velX * 1.001
    end
end

function collideBarsAndScore()
    local myScore = 0
    for i = 1, table.getn(bars) do
        bar = bars[i]
        if (bar.enabled) then
            if (collidingForTwoRectangles(bar)) then
                collisions =  collisions + 1
                bar.enabled = false
            end
        else
            myScore = myScore + 1
        end
    end
    score = myScore * 10;
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


function love.keypressed(key)

    if(gameOn) then
        if key == 'a' then
            launched = not launched
            ball.x = shooter.x 
            ball.y = shooter.y 
            ball.velX = shooter.x  - centerX
            ball.velY = shooter.y - height 
        end
    else
        if (key == 'r') then 
            love.load()
        end
    end
end

function collidingForTwoRectangles(obj)   
    globalOBJ =  obj
    local leftrightoverlap = math.min(obj.y+obj.height,ball.y+ball.halfheight)-math.max(obj.y,ball.y-ball.halfheight)
    local bottomtopoverlap = math.min(obj.x+obj.width,ball.x+ball.halfwidth)-math.max(obj.x,ball.x-ball.halfwidth)
    if (leftrightoverlap>0 and bottomtopoverlap>0) then
        if(leftrightoverlap>bottomtopoverlap) then 
            invertMovement("x")
        else
            invertMovement("y")
        end
        return true
    end
    return false
end

function collideBorders()
    if((ball.x + ball.radius > width) or (ball.x - ball.radius < 0)) then
        invertMovement("x")
        return true
    elseif((ball.y - ball.radius < 0)) then
        invertMovement("y")
        return true
    elseif ((ball.y + ball.radius > height)) then
        gameOn = false;
    end
    return false
end









