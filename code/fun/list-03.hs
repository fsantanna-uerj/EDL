-- LIST

data Lista a = Vazio | Par a (Lista a)
  deriving (Show)

l :: Lista Int
l = Par 1 (Par 2 (Par 3 (Par 4 Vazio)))

-- MAP

map' :: (a->b) -> Lista a -> Lista b
map' f l = case l of
            Vazio        -> Vazio
            (Par h tail) -> (Par (f h) (map' f tail))
f1 :: Int -> Int
f1 x = x*2
m1 = map' f1 l

-- FILTER

filter' :: (a->Bool) -> Lista a -> Lista a
filter' f l = case l of
                Vazio        -> Vazio
                (Par h tail) -> if (f h) then
                                    (Par h (filter' f tail))
                                else
                                    (filter' f tail)
f2 :: Int -> Bool
f2 x = ((mod x 2) == 1)
m2 = filter' f2 l

f = (filter' f2)
aaa = f l

-- FOLDL

foldl' :: (b->a->b) -> b -> Lista a -> b
foldl' f v l = case l of
                Vazio        -> v
                (Par h tail) -> foldl' f (f v h) tail
f3 :: Int -> Int -> Int
f3 x y = x - y
m3 = foldl' f3 0 l

-- FOLDR

foldr' :: (a->b->b) -> b -> Lista a -> b
foldr' f v l = case l of
                Vazio        -> v
                (Par h tail) -> (f h (foldr' f v tail))
m4 = foldr' f3 0 l

-- TESTS

--main = print l
--main = print m1
--main = print m2
--main = print m3
main = print m4
