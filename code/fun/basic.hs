l1 = [10,7,4,14,1,6]
m1 = map show l1
m2 = map (*2) l1
m3 = map (\x -> mod x 2 == 0) l1

l2 = [True,False,True,True]
m4 = map not l2

l3 = [ [1,2,3], [], [2,2] ]
m5 = map length l3

-- Qual é o tipo da função MAP ??
map :: (a -> b) -> [a] -> [b]

main = print m5
