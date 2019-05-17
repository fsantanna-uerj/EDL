data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
  deriving Show

e1 = Num 10
e2 = Add e1 e1
e3 = Sub (Num 100) e2

main = print e3
