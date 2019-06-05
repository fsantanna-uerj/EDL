import Debug.Trace

type Amb = String -> Int

-------------------------------------------------------------------------------

data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
  deriving Show

avaliaExp :: Amb -> Exp -> Int
avaliaExp amb (Num v)     = v
avaliaExp amb (Add e1 e2) = (avaliaExp amb e1) + (avaliaExp amb e2)
avaliaExp amb (Sub e1 e2) = (avaliaExp amb e1) - (avaliaExp amb e2)
avaliaExp amb (Var id)    = amb id

-------------------------------------------------------------------------------

data Cmd = Atr String Exp
         | Seq Cmd Cmd
         | Cnd Exp Cmd Cmd
  deriving Show

avaliaCmd :: Amb -> Cmd -> Amb
avaliaCmd amb (Atr id exp) = (\x -> if x==id then v
                                             else amb x)
                             where v = avaliaExp amb exp
avaliaCmd amb (Seq c1 c2)  = avaliaCmd amb' c2
                             where amb' = avaliaCmd amb c1
avaliaCmd amb (Cnd exp c1 c2) = if (avaliaExp amb exp) /= 0 then
                                  avaliaCmd amb c1
                                else
                                  avaliaCmd amb c2

-------------------------------------------------------------------------------

amb0 :: Amb
amb0 id = 0

prog :: Cmd
prog = Seq (Atr "x" (Num 10))
           (Seq (Atr "x" (Num 20))
                (Atr "y" (Var "x")))

p2 = Cnd (Num 0) (Atr "x" (Num 10)) (Atr "x" (Num 99))

main = print ((avaliaCmd amb0 p2) "x")
