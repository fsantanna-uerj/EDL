data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
  deriving Show

e1 = Num 10
e2 = Add e1 e1
e3 = Sub (Num 100) e2
e4 = Add (Num 5) (Var "i")

ambiente :: String -> Int
ambiente id = 10

avalia :: Exp -> Int
avalia (Num v)     = v
avalia (Add e1 e2) = (avalia e1) + (avalia e2)
avalia (Sub e1 e2) = (avalia e1) - (avalia e2)
avalia (Var id)    = ambiente id

main = print (avalia e4)
