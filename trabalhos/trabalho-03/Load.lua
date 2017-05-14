function love.load ()
    width = 800
    height = 600
    centerX = width/2
    centerY = height/2

    ceil = 0

    shooter = { x=50,  y=0, w=100, h=100, vy=0, ay=1,onGround = false }

    love.window.setMode( width, height, {fullscreen=false, vsync=false, msaa=0} )
end