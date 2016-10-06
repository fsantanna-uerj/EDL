import Html exposing (text)

type Dias = Seg | Ter | Qua | Qui | Sex | Sab | Dom

toName: Dias -> String
toName d =
  case d of
    Seg -> "Segunda"
    Ter -> "Terça"
    Qua -> "Quarta"
    Qui -> "Quinta"
    Sex -> "Sexta"
    Sab -> "Sábado"
    Dom -> "Domingo"
    --otherwise -> "???"
    
hoje = Sab

main = text (toString hoje)
--main = text (toName hoje)
