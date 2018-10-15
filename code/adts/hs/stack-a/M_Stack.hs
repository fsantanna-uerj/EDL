module M_Stack (create, empty, top, push, pop) where

type Stack a = [a]

create :: Stack a
create = []

empty :: Stack a -> Bool
empty [] = True
empty _  = False

top :: Stack a -> a
top s = head s

push :: a -> Stack a -> Stack a
push x s = (x : s)

pop :: Stack a -> Stack a
pop s = tail s
