<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></p>        

Slide 13 - Linguagem - Comandos
===============================

- Defina o **tipo** e a **implementação** de todas as funções pedidas nos
  exercícios a seguir.

-------------------------------------------------------------------------------

## 1.

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
type Mem = [(String,Int)]
    -- Associa um identificador a um valor inteiro
    -- O valor mais recente é adicionado no início
```

- Implemente as funções
    `avaliaExp :: Mem -> Exp -> Int` e
    `avaliaCmd :: Mem -> Cmd -> Mem`.
    - A resposta completa está no arquivo `lang-04.hs`.

- Teste **individualmente** as funções do item anterior.
    - Teste com diferentes ambientes iniciais.
    - Teste pelo menos 5 exemplos para cada função, variando os ambientes.

## 2.

- Crie uma função `avaliaProg :: Cmd -> Int`, que recebe um comando e retorna
  o valor final da variável `"ret"`.
    - Assuma um ambiente inicial onde variáveis não atribuídas tenham o valor
      `0` por padrão.

## 3.

Considere a seguinte representação para comandos:

```
data Cmd = Atr String Exp
         | Seq [Cmd]
```

- Reimplemente a função `avaliaCmd` da questão `1`.

## 4.

Adicione comandos de condição e repetição à questão `1`:

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

<!--

## 5.

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

- Altere a questão `1` para funcionar com essa nova representação.

-->
