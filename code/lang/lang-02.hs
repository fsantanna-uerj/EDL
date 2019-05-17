data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
  deriving Show

e1 = Num 10
e2 = Add e1 e1
e3 = Sub (Num 100) e2

avalia :: Exp -> Int
avalia (Num v)     = v
avalia (Add e1 e2) = (avalia e1) + (avalia e2)
avalia (Sub e1 e2) = (avalia e1) - (avalia e2)

main = print (avalia e3)
