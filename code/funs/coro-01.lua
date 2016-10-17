function f1 (v1)
  print("dentro", v1)
  io.read()
  local v2 = coroutine.yield(v1)
  print("dentro", v1+v2)
  io.read()
  return v1+v2
end

c1 = coroutine.create(f1)
io.read()
_,r1 = coroutine.resume(c1,10)
print("fora", r1)
io.read()
_,r2 = coroutine.resume(c1,20)
print("fora", r2)
io.read()
_,r3 = coroutine.resume(c1,30)
print("fora", r3)
