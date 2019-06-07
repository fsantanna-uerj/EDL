import Debug.Trace

-------------------------------------------------------------------------------
-- Sintaxe
-------------------------------------------------------------------------------

data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
  deriving Show

data Cmd = Atr String Exp
         | Seq Cmd Cmd
         | Dcl String
  deriving Show

-------------------------------------------------------------------------------
-- Verificacao
-------------------------------------------------------------------------------

verificaExp :: [String] -> Exp -> Bool
verificaExp vars (Var var)   = elem var vars
verificaExp vars (Add e1 e2) = verificaExp vars e1 && verificaExp vars e2
verificaExp vars (Sub e1 e2) = verificaExp vars e1 && verificaExp vars e2
verificaExp _    _           = True

verificaCmd :: [String] -> Cmd -> ([String], Bool)
verificaCmd vars (Dcl var)     = (var:vars, True)
verificaCmd vars (Atr var exp) = (vars,     (elem var vars) && (verificaExp vars exp))
verificaCmd vars (Seq c1 c2)   = (v2,       b1 && b2) where
                                  (v1,b1) = verificaCmd vars c1
                                  (v2,b2) = verificaCmd v1   c2

-------------------------------------------------------------------------------
-- Runtime
-------------------------------------------------------------------------------

type Amb = String -> Int

avaliaExp :: Amb -> Exp -> Int
avaliaExp amb (Num v)     = v
avaliaExp amb (Add e1 e2) = (avaliaExp amb e1) + (avaliaExp amb e2)
avaliaExp amb (Sub e1 e2) = (avaliaExp amb e1) - (avaliaExp amb e2)
avaliaExp amb (Var id)    = amb id

avaliaCmd :: Amb -> Cmd -> Amb
avaliaCmd amb (Atr id exp) = (\x -> if x==id then v
                                             else amb x)
                             where v = avaliaExp amb exp
avaliaCmd amb (Seq c1 c2)  = avaliaCmd amb' c2
                             where amb' = avaliaCmd amb c1
avaliaCmd amb (Dcl _)      = amb

-------------------------------------------------------------------------------

amb0 :: Amb
amb0 id = 0

p0 :: Cmd
p0 = Seq (Atr "x" (Num 10))
         (Seq (Atr "x" (Num 20))
              (Atr "y" (Var "x")))
p1 = Seq (Dcl "x") p0
p2 = Seq (Dcl "y") p1

main = print (verificaCmd [] p2)
