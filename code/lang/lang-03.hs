data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
  deriving Show

e1 = Num 10
e2 = Add e1 e1
e3 = Sub (Num 100) e2
e4 = Add (Num 5) (Var "i")

type Mem = [(String,Int)]

consulta :: Mem -> String -> Int
consulta []           id = 0
consulta ((id',v'):l) id = if id == id' then
                         v'
                       else
                         consulta l id

escreve :: Mem -> String -> Int -> Mem
escreve mem id v = (id,v):mem

avalia :: Mem -> Exp -> Int
avalia mem (Num v)     = v
avalia mem (Add e1 e2) = (avalia mem e1) + (avalia mem e2)
avalia mem (Sub e1 e2) = (avalia mem e1) - (avalia mem e2)
avalia mem (Var id)    = consulta mem id

--main = print (avalia [] e4)
main = print (avalia [("i",10),("i",5)] e4)
