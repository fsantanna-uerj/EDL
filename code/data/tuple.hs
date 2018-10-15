pos :: (Int,Int)
pos = (10, 10)

preco :: (Int, String)
preco = (10, "reais")

type Preco = (Int, String)
preco1 = (10, "reais")
preco2 = (20, "dolares")

(v1,_) = preco1
(v2,_) = preco2

--main = print pos
--main = print preco
--main = print ((fst preco1) + (fst preco2))
--main = print (v1 + v2)
