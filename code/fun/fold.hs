l :: [Int]
l = [1, 2, 3, 4]



f1 :: Int -> Int -> Int
f1 x y = (x + y)
m1 = foldr f1 0 l



f2 :: Int -> Int -> Int
f2 x y = (x * y)
m2 = foldr f2 1 l



f3 :: Int -> Bool -> Bool
f3 i b = b || (i == 10)
b = foldr f3 False [1,2,10,3,4]

main = print l
--main = print m1
--main = print m2
--main = print b
