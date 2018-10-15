lista :: [Int]

lista = [1, 2, 3, 4]

listByCons = (1 : (2 : (3 : (4 : []))))

t :: [Int]
t = tail lista

h :: Int
h = head lista

main = print lista
--main = print listByCons
--main = print t
--main = print h
