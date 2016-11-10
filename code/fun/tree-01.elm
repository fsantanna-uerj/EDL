import Html exposing (text)

-- Exp

type Tree = Leaf | Node Tree Tree

t1 = Node (Node Leaf Leaf) (Node Leaf Leaf)
t2 = Node (Node (Node Leaf Leaf) Leaf) Leaf

sum : Tree -> Int
sum t =
    case t of
        Leaf     -> 1
        Node l r -> (sum l) + (sum r)

--main = text (toString t1)
--main = text (toString t2)
main = text (toString (sum t2))
