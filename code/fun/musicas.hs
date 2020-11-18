bandas :: [[String]]
bandas = [ ["Gilberto Gil"],
           ["Victor","Leo"],
           ["Gonzagao"],
           ["Claudinho","Bochecha"] ]

type Musica = (String, Int, Int)
musicas :: [Musica]
musicas = [ ("Aquele Abraco",       0, 100),
            ("Esperando na Janela", 0, 150),
            ("Borboletas",          1, 120),
            ("Asa Branca",          2, 120),
            ("Assum Preto",         2, 140),
            ("Vem Morena",          2, 200),
            ("Nosso Sonho",         3, 150),
            ("Quero te Encontrar",  3, 100) ]

nom :: Musica -> String
nom (v,_,_) = v

idx :: Musica -> Int
idx (_,v,_) = v

dur :: Musica -> Int
dur (_,_,v) = v

nomes = map nom musicas
longas = filter (\mus -> (dur mus)>=120) musicas
durs = map dur musicas
maior = foldr (\vl va -> if vl > va then vl else va) 0 durs
nomes_longas = map nom longas
autores = map (\mus -> bandas !! (idx mus)) musicas

main = print autores
