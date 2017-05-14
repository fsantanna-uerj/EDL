function collidingForTwoRectangles(obj)   
   local leftrightoverlap = math.min(obj.y+obj.halfheight,ball.y+ball.halfheight)-math.max(obj.y-obj.halfheight,ball.y-ball.halfheight)
   local bottomtopoverlap = math.min(obj.x+obj.halfwidth,ball.x+ball.halfwidth)-math.max(obj.x-obj.halfwidth,ball.x-ball.halfwidth)
      return leftrightoverlap>0 and bottomtopoverlap>0
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