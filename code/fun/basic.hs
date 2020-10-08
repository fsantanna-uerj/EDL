tamanho :: ([a] -> Int)
tamanho l =
  case l of
    []        -> 0
    x : resto -> 1 + (tamanho resto)

main = print ((tamanho "ola ola") + (tamanho [1,2,3]))
