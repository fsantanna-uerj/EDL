module M_Stack where
--module M_Stack (create, empty, top, push, pop) where

type Stack = [Int]

create :: Stack
create = []

empty :: Stack -> Bool
empty [] = True
empty _  = False

top :: Stack -> Int
top s = head s

push :: Int -> Stack -> Stack
push x s = (x : s)

pop :: Stack -> Stack
pop s = tail s
