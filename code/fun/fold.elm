import Html exposing (text)

l: List Int
l = [1, 2, 3, 4]

f1: Int -> Int -> Int
f1 x y = (x + y)
m1 = List.foldl f1 0 l

f2: Int -> Int -> Int
f2 x y = (x * y)
m2 = List.foldl f2 1 l

main = text (toString l)
--main = text (toString m1)
--main = text (toString m2)
