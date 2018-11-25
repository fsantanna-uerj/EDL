-- LIST

data Lista = Vazio | Par Int Lista
  deriving (Show)

l :: Lista
l = Par 1 (Par 2 (Par 3 (Par 4 Vazio)))

-- MAP

map' :: (Int->Int) -> Lista -> Lista
map' f l =
    case l of
        Vazio    -> Vazio
        Par v l' -> Par (f v) (map' f l')

vezes2 :: Int -> Int
vezes2 v = v*2

-- FILTER

filter' :: (Int->Bool) -> Lista -> Lista
filter' f l =
    case l of
        Vazio    -> Vazio
        Par v l' ->
            if (f v) then
                (Par v (filter' f l'))
            else
                (filter' f l')

ehpar :: Int -> Bool
ehpar v = ((mod v 2) == 0)

--main = print l
--main = print (map' vezes2 l)
main = print (filter' ehpar l)
