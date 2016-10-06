import Html exposing (text)

list: List Int
list = [1, 2, 3, 4]
listFromRange = [1..4]
listByAppending = [1, 2] ++ [3, 4]
listByPrepending = 1 :: 2 :: 3 :: 4 :: []

h: Maybe Int
h = List.head list

t: Maybe (List Int)
t = List.tail list

--main = text (toString listByPrepending)
--main = text (toString h)
main = text (toString t)
