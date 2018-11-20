l :: [Int]
l = [1, 2, 3, 4]



f1 :: Int -> Bool
f1 x = ((mod x 2) == 1)
m1 = filter f1 l



f2 :: Int -> Bool
f2 x = (x > 2)
m2 = filter f2 l



main = print l
--main = print m1
--main = print m2
