type Pessoa = (String,Int,Bool)

nome :: Pessoa -> String
nome (x,_,_) = x

idade :: Pessoa -> Int
idade (_,y,_) = y

masc :: Pessoa -> Bool
masc (_,_,z) = z

main = print (masc ("Joao",25,True))
