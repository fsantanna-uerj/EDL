import Html exposing (text)

type Exp = Add Exp Exp
         | Num Int

evalExp : Exp -> Int
evalExp exp =
    case exp of
        Add exp1 exp2  -> (evalExp exp1) + (evalExp exp2)
        Num v          -> v

e1 : Exp
e1 = Add (Num 9) (Num 1)

e2 : Exp
e2 = Add (Num 9) (Add (Num 1) (Num 90))

main = text (toString (evalExp e1))
--main = text (toString (evalExp e2))
