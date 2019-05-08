data Arvore = Folha Int | Galho Arvore Arvore
  deriving Show

t1 = Galho (Galho (Folha 1) (Folha 2)) (Galho (Folha 3) (Folha 4))
t2 = Galho (Galho (Galho (Folha 1) (Folha 2)) (Folha 3)) (Folha 4)

soma :: Arvore -> Int
soma (Folha v)   = v
soma (Galho l r) = (soma l) + (soma r)

--main = print t1
main = print (soma t2)
