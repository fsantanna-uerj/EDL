data Dias = Seg | Ter | Qua | Qui | Sex | Sab | Dom

paraNome :: Dias -> String
paraNome d =
  case d of
    Sab -> "Sábado"
    Dom -> "Domingo"
    --otherwise -> "Dia de Trabalho"
    
hoje = Seg

main = print (paraNome hoje)
