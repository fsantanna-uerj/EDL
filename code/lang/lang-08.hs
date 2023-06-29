import Debug.Trace

data Value = I Int | F Exp
  deriving Show

type Mem = [(String,Value)]

consulta :: Mem -> String -> Value
consulta []           id = I 0
consulta ((id',v'):l) id = if id == id' then
                         v'
                       else
                         consulta l id

escreve :: Mem -> String -> Value -> Mem
escreve mem id v = (id,v):mem

-------------------------------------------------------------------------------

data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
         | Fun Exp
         | Cal Exp
  deriving Show

avaliaExp :: Mem -> Exp -> Value
avaliaExp mem (Num v)     = I v
avaliaExp mem (Add e1 e2) = I (v1 + v2) where
  I v1 = (avaliaExp mem e1)
  I v2 = (avaliaExp mem e2)
avaliaExp mem (Sub e1 e2) = I (v1 - v2) where
  I v1 = (avaliaExp mem e1)
  I v2 = (avaliaExp mem e2)
avaliaExp mem (Var id)    = consulta mem id
avaliaExp mem (Fun e)     = F e
avaliaExp mem (Cal f)     = avaliaExp mem f

-------------------------------------------------------------------------------

data Cmd = Atr String Exp
         | Seq Cmd Cmd
         | Cnd Exp Cmd Cmd
         | Cal Exp
  deriving Show

avaliaCmd :: Mem -> Cmd -> Mem
avaliaCmd mem (Atr id exp) = escreve mem id v where
                               v = avaliaExp mem exp
avaliaCmd mem (Seq c1 c2)  = avaliaCmd mem' c2 where
                               mem' = avaliaCmd mem c1
avaliaCmd mem (Cnd exp c1 c2) =
  case (avaliaExp mem exp) of
    I 0       -> avaliaCmd mem c2
    otherwise -> avaliaCmd mem c1


-------------------------------------------------------------------------------

prog :: Cmd
prog = Seq (Atr "x" (Num 10))
           (Seq (Atr "x" (Num 20))
                (Atr "y" (Var "x")))

p2 = Cnd (Num 0) (Atr "x" (Num 10)) (Atr "x" (Num 99))

p3 = 

main = print (avaliaCmd [] p2)
