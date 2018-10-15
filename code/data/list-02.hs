-- LIST

data Lista a = Vazio | Par a (Lista a)
    deriving (Show)

l :: Lista Int
l = Par 1 (Par 2 (Par 3 (Par 4 Vazio)))

mmap :: (a -> b) -> (Lista a) -> (Lista b)
mmap f l =
    case l of
        Vazio    -> Vazio
        Par v ll -> Par (f v) (mmap f ll)

dobro :: Int -> Int
dobro v = 2*v

main = print (mmap (\x -> (x `mod` 2)==1) l)
















