import Debug.Trace

type Mem = [(String,Int)]

consulta :: Mem -> String -> Int
consulta []           id = 0
consulta ((id',v'):l) id = if id == id' then
                         v'
                       else
                         consulta l id

escreve :: Mem -> String -> Int -> Mem
escreve mem id v = (id,v):mem

-------------------------------------------------------------------------------

data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
  deriving Show

avaliaExp :: Mem -> Exp -> Int
avaliaExp mem (Num v)     = v
avaliaExp mem (Add e1 e2) = (avaliaExp mem e1) + (avaliaExp mem e2)
avaliaExp mem (Sub e1 e2) = (avaliaExp mem e1) - (avaliaExp mem e2)
avaliaExp mem (Var id)    = consulta mem id

-------------------------------------------------------------------------------

data Cmd = Atr String Exp
         | Seq Cmd Cmd
         | Cnd Exp Cmd Cmd
         | Prt Exp
  deriving Show

avaliaCmd :: Mem -> Cmd -> Mem
avaliaCmd mem (Atr id exp) = escreve mem id v where
                               v = avaliaExp mem exp
avaliaCmd mem (Seq c1 c2)  = avaliaCmd mem' c2 where
                               mem' = avaliaCmd mem c1
avaliaCmd mem (Cnd exp c1 c2) = if (avaliaExp mem exp) /= 0 then
                                  avaliaCmd mem c1
                                else
                                  avaliaCmd mem c2
avaliaCmd mem (Prt e) = traceShow (avaliaExp mem e) mem

-------------------------------------------------------------------------------

prog :: Cmd
prog = Seq (Atr "x" (Num 10))
           (Seq (Atr "x" (Num 20))
                (Seq (Atr "y" (Var "x"))
                     (Prt (Var "y"))))

main = print (avaliaCmd [] prog)
