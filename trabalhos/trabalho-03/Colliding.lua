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