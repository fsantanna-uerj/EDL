import Html exposing (text)

list: List Int
list = [1, 2, 3, 4]
listFromRange = [1..4]
listByAppending = [1, 2] ++ [3, 4]
listByPrepending = 1 :: 2 :: 3 :: 4 :: []

t: Maybe (List Int)
t = List.tail list

h: Maybe Int
h = List.head list

--main = text (toString list)
--main = text (toString listFromRange)
--main = text (toString listByAppending)
--main = text (toString listByPrepending)
--main = text (toString t)
main = text (toString h)
