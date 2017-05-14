-- function checkGround()
--     shooter.onGround = shooter.y >= 500
-- end

-- function gravity(dt)
--     if(not shooter.onGround) then
--         shooter.ay = shooter.ay + 5*dt    
--     end
-- end

-- function move( dt )
--     if(ball.y <= ceil) then
--         ball.vy = 0
--         ball.ay = 0
--         ball.y = 1
--     elseif(true) then
--         ball.vx = ball.vx + ball.ax
--         ball.vy = ball.vy + ball.ay
--         if (ball.y + ball.vy*dt < 500) then
--             ball.y = ball.y + ball.vy*dt
--         else
--             ball.y = 500
--             stop()
--         end
--     end
-- end

-- function stop()
--     angle = 0
--     shooter.vy = 0
--     shooter.ay = 0
-- end

-- function impulse(qt)
--     shooter.y = 499
--     shooter.ay = -qt
-- end

-- function collides (o1, o2)
--     return (o1.x+o1.w >= o2.x) and (o1.x <= o2.x+o2.w) and
--            (o1.y+o1.h >= o2.y) and (o1.y <= o2.y+o2.h)
-- end