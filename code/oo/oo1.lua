r1 = { x=10, y=10, w=100, h=100 }
print('r1', r1.x, r1.y, r1.w, r1.h)

function clone (proto)
    local new = {}
    for k,v in pairs(proto) do
        new[k] = v
    end
    return new
end

r2 = clone(r1)
print('r2', r2.x, r2.y, r2.w, r2.h)
r2.getArea = function ()
                return r2.w * r2.h
             end
print('r2.area', r2.getArea())

r3 = clone(r2)
r3.h = 200
print('r3', r3.x, r3.y, r3.w, r3.h)
print('r3.area', r3.getArea())
r3.getArea = function (o)
                return o.w * o.h
             end
print('r3.area', r3.getArea(r3))
print('r3.area', r3:getArea())

r4 = clone(r3)
r4.w = 200
print('r4', r4.x, r4.y, r4.w, r4.h)
print('r4.area', r4:getArea())

r5 = {}
setmetatable(r5, { __index=r4 })
print('r5', r5.x, r5.y, r5.w, r5.h)
print('r5.area', r5:getArea())
r5.w = 400
print('r5', r5.x, r5.y, r5.w, r5.h)
print('r5.area', r5:getArea())

Rect = {
    getArea = function (self)
        return self.w * self.h
    end
}

function new (class, default)
    local o = default or {}
    setmetatable(o, {__index=class})
    return o
end

r6 = new(Rect, {x=1,y=1, w=10,h=10})
print('r6', r6.x, r6.y, r6.w, r6.h)
print('r6.area', r6:getArea())

Shape = {
    getXY = function (self)
        return self.x, self.y
    end,
    draw = error
}
Rect = new(Shape, Rect)

r7 = new(Rect, {x=1,y=1, w=10,h=10})
print('r7', r7.x, r7.y, r7.w, r7.h)
print('r7.area', r7:getArea())
print('r7.xy',   r7:getXY())
--r7:draw()

Rect.draw = function (self) print('Desenhei um rect em ', self:getXY()) end
r7:draw()
