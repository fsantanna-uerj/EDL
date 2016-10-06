import Html exposing (text)

pos: (Int,Int)
pos = (10, 10)

preco: (Int, String)
preco = (10, "reais")

type alias Preco = (Int, String)
preco1 = (10, "reais")
preco2 = (20, "dolares")

(v1,_) = preco1
(v2,_) = preco2

--main = text (toString pos)
--main = text (toString preco)
--main = text (toString ((fst preco1) + (fst preco2)))
main = text (toString (v1 + v2))
