<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></p>        

Slide 14 - Linguagem - Verificação
==================================

- Defina o **tipo** e a **implementação** de todas as funções pedidas nos
  exercícios a seguir.

-------------------------------------------------------------------------------

## 1.

Considere as seguintes representações para comandos e expressões:

```
data Cmd = Atr String Exp   -- atribuicao, ex.: x=1
         | Seq Cmd Cmd      -- sequencia,  ex.: x=1 ; y=x
         | Dcl String       -- declaracao, ex.: int x

data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
```

Um programa só é valido caso os identificadores usados nos comandos `Atr` e
expressões `Var` tenham sido previamente declarados com comandos `Dcl`.

- Implemente as funções
    `verificaExp :: [String] -> Exp -> Bool` e
    `verificaCmd :: [String] -> Cmd -> ([String],Bool)`.
    - O argumento `[String]` é uma lista de identificadores declarados antes de
      aplicar um comando, ou seja, o seu ambiente estático.
    - As funções devem retornar se a expressão ou comando é válida.
    - `verificaCmd` também deve retornar uma nova lista de identificadores que
      inclui os que o comando passado declarou.
    - A resposta completa está no arquivo `lang-06.hs`.

- Teste as funções individualmente com casos válidos e inválidos.

## 2.

- Crie uma função `verificaProg :: Cmd -> Bool`, que recebe um comando e
  retorna se o comando é válido de acordo com a questão `1`.

- Crie uma função `avaliaProg :: Cmd -> Maybe Int`, que recebe um comando e
  retorna o valor final da variável `ret` caso o programa seja válido.
    - O tipo `Maybe` deve ser usado da seguinte forma:
        - Caso o programa seja inválido, a função deve retornar `Nothing`.
        - Caso o programa seja válido, a função deve retornar `Just ret`.

## 3.

O comando `Dcl` não possui nenhum efeito durante a execução de um programa, em
`avaliaCmd`.

- Crie uma função `eliminaDcl :: Cmd -> Cmd` que recebe um comando e retorna
    um novo comando sem nenhum `Dcl` em sua árvore.
- Altere a função `avaliaProg` da questão `2` de modo que ela não mais avalie
    comandos `Dcl` inócuos.
