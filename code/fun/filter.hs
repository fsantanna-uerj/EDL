l1 = [10, 20, 30, 40]

m1 = filter (>25) l1

type Pessoa = (String,Int,Bool)
nome  (x,_,_) = x
idade (_,y,_) = y
masc  (_,_,z) = z

maior_18 :: Pessoa -> Bool
maior_18 p = (idade p) >= 18

ps = [("Joao",25,True), ("Maria",10,False), ("Jose",70,True)]

ps2 = filter maior_18 ps

-- Qual é o tipo da FILTER ??

filter :: (a -> Bool) -> [a] -> [a]
              f           l      m

main = print ps2
