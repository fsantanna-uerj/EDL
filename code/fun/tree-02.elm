import Html exposing (text)

-- Exp

type Tree = Leaf Int | Node Tree Tree

t1 = Node (Node (Leaf 1) (Leaf 2)) (Node (Leaf 3) (Leaf 4))
t2 = Node (Node (Node (Leaf 1) (Leaf 2)) (Leaf 3)) (Leaf 4)

sum : Tree -> Int
sum t =
    case t of
        Leaf v   -> v
        Node l r -> (sum l) + (sum r)

--main = text (toString t1)
main = text (toString (sum t2))
