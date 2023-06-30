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
         | Mul Exp Exp
         | Add Exp Exp
         | Sub Exp Exp
         | Neq Exp Exp
         | Var String
         | Fun Exp
         | Cal Exp
  deriving Show

avaliaExp :: Mem -> Exp -> Value
avaliaExp mem (Num v)     = I v
avaliaExp mem (Fun e)     = F e
avaliaExp mem (Var id)    = consulta mem id
avaliaExp mem (Add e1 e2) = I (v1 + v2) where
  I v1 = avaliaExp mem e1
  I v2 = avaliaExp mem e2
avaliaExp mem (Sub e1 e2) = I (v1 - v2) where
  I v1 = avaliaExp mem e1
  I v2 = avaliaExp mem e2
avaliaExp mem (Neq e1 e2) = I (if (v1 /= v2) then 1 else 0) where
  I v1 = avaliaExp mem e1
  I v2 = avaliaExp mem e2
avaliaExp mem (Cal e)     = avaliaExp mem f where
  F f  = avaliaExp mem e

-------------------------------------------------------------------------------

data Cmd = Atr String Exp
         | Seq Cmd Cmd
         | Cnd Exp Cmd Cmd
         | Rep Exp Cmd
         | Prt Exp
  deriving Show

avaliaCmd :: Mem -> Cmd -> Mem
avaliaCmd mem (Atr id exp) = escreve mem id v where
                               v = avaliaExp mem exp
avaliaCmd mem (Seq c1 c2)  = avaliaCmd mem' c2 where
                               mem' = avaliaCmd mem c1
avaliaCmd mem (Cnd cnd c1 c2) = if v /= 0 then
                                  avaliaCmd mem c1
                                else
                                  avaliaCmd mem c2
                                where
                                  I v = avaliaExp mem cnd
avaliaCmd mem (Rep cnd cmd) = if v == 0 then
                                 mem
                              else
                                 avaliaCmd (avaliaCmd mem cmd) (Rep cnd cmd)
                              where
                                I v = avaliaExp mem cnd
avaliaCmd mem (Prt e) = traceShow (avaliaExp mem e) mem

-------------------------------------------------------------------------------

--coletor :: Mem -> Mem
--coletor 

-------------------------------------------------------------------------------

prog :: Cmd
prog = Seq (Atr "f" (Fun (Num 10)))
           (Prt (Cal (Var "f")))

lang :: Cmd -> Value
lang cmd = consulta (avaliaCmd [] cmd) "ret"

main = print (lang prog)
