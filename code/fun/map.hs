l :: [Int]
l = [1, 2, 3, 4]



f1 :: Int -> Int
f1 x = x*2

m1 = map f1 l



f2 :: Int -> Bool
f2 x = ((mod x 2) == 1)
m2 = map f2 l



f3 :: Bool -> Bool
f3 x = not x
m3 = map f3 m2

main = print l
--main = print m1
--main = print m2
--main = print m3
