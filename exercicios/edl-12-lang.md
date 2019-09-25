<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></p>        

Slide 11 - Linguagem
====================

- Defina o **tipo** e a **implementação** de todas as funções pedidas nos
  exercícios a seguir.

## 1.

Considere a seguinte representação para expressões:

```
data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
```

- Defina valores do tipo `Exp` para as seguintes expressões:
    - `1`
        - Resposta: `e0 = Num 1`
    - `1 + 10 - 20`
    - `1 + (10 - 20)`
    - `(5 + 5) - (5 - 5)`

- Escreva e calcule as expressões correspondentes aos seguintes valores:
    - `e0 = Add (Num 1) (Num 2)`
        - Resposta: `1 + 2`
    - `e1 = Add (Add (Add (Num 1) (Num 2)) (Num 3)) (Num 4)`
    - `e2 = Add (Num 1) (Add (Num 2) (Add (Num 3) (Num 4)))`
    - `e3 = Sub (Sub (Sub (Num 1) (Num 2)) (Num 3)) (Num 4)`
    - `e4 = Sub (Num 1) (Sub (Num 2) (Sub (Num 3) (Num 4)))`
    - `e5 = Sub (Sub (Num 1) (Num 2)) (Sub (Num 3) (Num 4))`

- Defina a função `avalia` que recebe uma expressão e retorna o valor inteiro
  correspondente a sua avaliação.

- Em vez de retornar um inteiro, defina a função `avalia'` que retorna a
  expressão reduzida a um caso `Num`, ex.:
    - `avalia (Add (Num 1) (Num 2)` `-->` `Num 3`

## 2.

- Adicione as operações de multiplicação e divisão ao exercício `1`.
    - Redefina a representação.
    - Redefina as funções `avalia` e `avalia'`.

## 3.

Considere o tipo `Exp` para representar expressões definido na questão `1`:

```
data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
```

Considere a variável `e1` que representa a expressão `(1+2) - 5` a seguir:

```
e1 = Sub (Add (Num 1) (Num 2)) (Num 5)
```

Considere também a sua implementação da função `avalia` da questão `1`:

```
avalia :: Expr -> Int
```

- Reescreva o tipo `Exp`, a variável `e1` e a função `avalia` na linguagem C.
    - Dica: o tipo `Exp` deve usar `struct`, `union` e `enum`.
- Com base nesse exercício, faça uma análise sobre a expressividade das duas
  linguagens.

## 4.

- Refaça a questão `3` usando a linguagem Java.
    - Dica: o tipo `Exp` deve ser uma classe abstrata e os subtipos devem ser
            subclasses.
- Com base nesse exercício, faça uma análise sobre a expressividade das duas
  linguagens.

## 5.

- Adicione expressões booleanas (`and`, `or`, `not`) ao exercício `1`.
    - Redefina a representação.
    - Redefina as funções `avalia`.
    - Qual decisão de projeto foi necessária, por quê ela foi necessária e qual
      foi a sua escolha?

## 6.

- Adicione expressões condicionais (`>`, `==`, etc) ao exercício `1`.
    - Redefina a representação.
    - Redefina as funções `avalia`.
    - Qual decisão de projeto foi necessária, por quê ela foi necessária e qual
      foi a sua escolha?

-------------------------------------------------------------------------------

## 7.

Considere as seguintes representações para comandos e expressões:

```
data Cmd = Atr String Exp   -- atribuicao, ex.: x=1
         | Seq Cmd Cmd      -- sequencia,  ex.: x=1 ; y=x

data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
```

- Defina valores do tipo `Cmd` para os seguintes comandos:
    - `x = 1`
        - Resposta: `c0 = Atr "x" (Num 1)`
    - `x = 1 + x - 20`
    - `x = 1 ; y = 2 ; z = x+y`

- Escreva e calcule o valor final de `x` paras os comandos correspondentes aos
  seguintes valores:
    - `c0 = Atr "x" (Add (Num 1) (Num 2))`
        - Resposta: `x = 1 + 2   -- (valor final x=3)`
    - `c1 = Seq (Atr "x" (Num 10)) (Atr "x" (Num 1))`
    - `c2 = Seq (Atr "x" (Num 1)) (Seq (Atr "y" (Add (Var "x") (Num 1))) (Atr "x" (Var "y")))`

Considere a representação a seguir para um ambiente de variáveis:

```
type Amb = String -> Int
    -- uma funcao que recebe um identificador de uma variavel
    -- e retorna o valor inteiro atual associado a ela
```

- Implemente as funções
    `avaliaExp :: Amb -> Exp -> Int` e
    `avaliaCmd :: Amb -> Cmd -> Amb`.
    - A resposta completa está no arquivo `lang-04.hs`.

- Teste **individualmente** as funções do item anterior.
    - Teste com diferentes ambientes iniciais.
    - Teste pelo menos 5 exemplos para cada função, variando os ambientes.

## 8.

- Crie uma função `avaliaProg :: Cmd -> Int`, que recebe um comando e retorna
  o valor final da variável `ret`.
    - Assuma um ambiente inicial onde variáveis não atribuídas tenham o valor
      `0` por padrão.

## 9.

Considere a seguinte representação para comandos:

```
data Cmd = Atr String Exp
         | Seq [Cmd]
```

- Reimplemente a função `avaliaCmd` da questão `7`.

## 10.

Adicione comandos de condição e repetição à questão `7`:

```
data Cmd = Atr String Exp
         | Seq Cmd Cmd
         | Cnd Exp Cmd Cmd
         | Rep Exp Cmd
```

- Reimplemente a função `avaliaCmd` para tratar os novos comandos.

- Teste programas com as especificações a seguir:
    - Calcule a soma de `x` até `y` (`x + x+1 + x+2 + ... + y`).
    - Calcule a soma dos quadrados de `1` até `10` (`1*1 + 2*2 + ... + 10*10`).

## 11.

Nos exercícios anteriores, a definição de ambiente usa uma função:

```
type Amb = String -> Int
```

Altere a definição de ambientes para uma lista de pares `(String,Int)` que
mapeia o identificador de uma variável para o seu valor atual:

```
type Amb = [(String,Int)]
```

Por exemplo, na lista a seguir, o valor de `x` é `3` e o de `y` é `5` (valor
mais atual):

```
amb1 = [("y",5),("x",3),("z",2),("y",1)]
```

- Altere a questão `7` para funcionar com essa nova representação.

-------------------------------------------------------------------------------

## 12.

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

## 13.

- Crie uma função `verificaProg :: Cmd -> Bool`, que recebe um comando e
  retorna se o comando é válido de acordo com a questão `12`.

- Crie uma função `avaliaProg :: Cmd -> Maybe Int`, que recebe um comando e
  retorna o valor final da variável `ret` caso o programa seja válido.
    - Baseie-se na questão `8`.
    - O tipo `Maybe` deve ser usado da seguinte forma:
        - Caso o programa seja inválido, a função deve retornar `Nothing`.
        - Caso o programa seja válido, a função deve retornar `Just ret`.

## 14.

Nos exercícios anteriores, a definição de ambiente estático usa uma lista:

```
type AmbE = [String]    -- ambiente estatico
```

Altere a definição de ambientes para uma função que dado um
identificador, retorna se ele está declarado ou não:

```
type AmbE = String -> Bool
```

- Altere a questão `12` para funcionar com essa nova representação.
