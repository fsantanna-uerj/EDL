data Usuario = Anonimo | Cadastrado String Int
    deriving (Show)

u1 = Anonimo
u2 = Cadastrado "Joao Silva" 31

getIdade :: Usuario -> Int
getIdade u =
    case u of
        Anonimo -> 0
        (Cadastrado _ x) -> x

main = print u1
--main = print u2
--main = print (getIdade u2)
