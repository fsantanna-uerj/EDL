import Html exposing (text)

list: List Int

list = [1, 2, 3, 4]

listByCons = (1 :: (2 :: (3 :: (4 :: []))))

t: Maybe (List Int)
t = List.tail list

h: Maybe Int
h = List.head list

--main = text (toString list)
main = text (toString listByCons)
--main = text (toString t)
--main = text (toString h)
