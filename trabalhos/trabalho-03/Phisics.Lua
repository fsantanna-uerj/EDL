function checkGround()
    shooter.onGround = shooter.y >= 500
end

function gravity(dt)
    if(not shooter.onGround) then
        shooter.ay = shooter.ay + 5*dt    
    end
end

function move( dt )
    if(shooter.y <= ceil) then
        shooter.vy = 0
        shooter.ay = 0
        shooter.y = 1
    elseif(not shooter.onGround) then
        shooter.vy = shooter.vy + shooter.ay
        if (shooter.y + shooter.vy*dt < 500) then
            shooter.y = shooter.y + shooter.vy*dt
        else
            shooter.y = 500
            stop()
        end
    end
end

function stop()
    shooter.vy = 0
    shooter.ay = 0
end

function impulse(qt)
    shooter.y = 499
    shooter.ay = -qt
end

function collides (o1, o2)
    return (o1.x+o1.w >= o2.x) and (o1.x <= o2.x+o2.w) and
           (o1.y+o1.h >= o2.y) and (o1.y <= o2.y+o2.h)
end