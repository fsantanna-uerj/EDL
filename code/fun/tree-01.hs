data Arvore = Folha | Galho Arvore Arvore
  deriving Show

t1 = Galho (Galho Folha Folha) (Galho Folha Folha)
t2 = Galho (Galho (Galho Folha Folha) Folha) Folha

folhas :: Arvore -> Int
folhas Folha      = 1
folhas (Galho l r) = (folhas l) + (folhas r)

--main = print t1
--main = print t2
main = print (folhas t2)
