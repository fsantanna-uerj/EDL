import Html exposing (text)

-- LIST

type Lista a = Vazio | Par a (Lista a)

l: Lista Int
l = Par 1 (Par 2 (Par 3 (Par 4 Vazio)))

-- FOLDL

foldl: (b->a->b) -> b -> Lista a -> b
foldl f v l = case l of
                Vazio        -> v
                (Par h tail) -> foldl f (f v h) tail
f3: Int -> Int -> Int
f3 x y = x + y
v1 = foldl f3 0 l

-- FILTER

filter: (a->Bool) -> (Lista a) -> (Lista a)
filter f l =
    foldl
        (\acc new ->
            if (f new) then
                Par new acc
            else
                acc)
        Vazio
        l
l2 = filter (\x -> (x%2 == 1)) l

-- MAP

map: (a->b) -> (Lista a) -> (Lista b)
map f l =
    foldl
        (\acc new -> Par (f new) acc)
        Vazio
        l
l3 = map (\x -> (x*2)) l

-- TESTS

--main = text (toString v1)
main = text (toString l3)
