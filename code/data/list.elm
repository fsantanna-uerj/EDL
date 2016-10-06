import Html exposing (text)

list: [Int]
list = [1, 2, 3, 4]
listFromRange = [1..4]
listByAppending = [1, 2] ++ [3, 4]
listByPrepending = 1 :: 2 :: 3 :: 4 :: []

h: Int
h = List.head list

t: [Int]
t = List.tail list

--main = text (toString listByPrepending)
--main = text (toString h)
main = text (toString t)
