xs :: [Int]
xs = [1,2,3,4]

duplica :: Int -> Int
duplica n = n * 2

ys :: [Int]
ys = map duplica xs

maior2 :: Int -> Bool
maior2 n = n > 2

zs :: [Int]
zs = filter maior2 xs

n :: Int
n = foldr (+) 0 xs

main = print (xs,ys,zs,n)
