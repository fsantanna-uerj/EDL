<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></p>        

Slide 15 - Linguagem - Funções
==============================

- Defina o **tipo** e a **implementação** de todas as funções pedidas nos
  exercícios a seguir.

- Considere a linguagem definida `lang-07-func.hs` para todos os exercícios
  a seguir:
    - https://github.com/fsantanna-uerj/EDL/blob/master/code/lang/lang-07-func.hs

-------------------------------------------------------------------------------

## 1. Converta os programas a seguir

Por exemplo, o programa em Python...

```
# Python
print (10)
```

É transformado em...

```
-- Lang
Prt (Num 10)
```

1.

```
x = 1
y = 2
print(x + y)
```

2.

```
def duplica (x):
    return x+x
print(duplica(10))
```

3.

```
def soma (v):
    if v != 0:
        return v + soma(v-1)
    else:
        return 0
```

## 2.

Altere a linguagem para as funções aceitarem um nome para o seu único
parâmetro.
O comando de definição de função deve ficar assim:

```
data Cmd = ...
         | Fun String String Cmd   -- nome da funcao, *nome do parametro*, corpo
```

Assim, os programas poderão usar o nome escolhido no lugar da variável especial
`"Arg"`:

```
Fun "duplica" "x"
  (Atr "ret" (Add (Var "x") (Var "x")))
```

- Nota: Internamente, a linguagem continuará usando `"Arg"` como o mecanismo de
    comunicação entre a função (`Fun`) e a sua chamada (`App`).

## 3.

Considere o programa em Python a seguir:

```
y = 10
def f (x):
    y = x
    print(y)    # ???
    return y

print(f(20))
print(y)        # ???
```

- Antes de executar esse programa, qual é o resultado que você espera pra os
  dois `print`?
- Converta esse programa para a nossa linguagem e execute-o.
    - O comportamento se manteve?
- Baseado na implementação de `avaliaCmd` e `avaliaExp`, explique porque o
  valor de `y` exibido dentro e fora de `f` são diferentes.
- Que mudanças teriam que ser feitas na implementação da linguagem para que o
  `y` atribuído dentro da função se mantivesse ao retornar?

## 4.

Altere a linguagem para também aceitar funções com dois parâmetros:

```
data Cmd = ...
         | Fun  String String Cmd           -- 1 parametro
         | Fun2 String (String,String) Cmd  -- 2 parametros

data Exp = ...
         | App  String Exp                  -- 1 argumento
         | App2 String (Exp,Exp)            -- 2 argumentos
```

- Dica: É necessário considerar uma nova varável `"Arg2"` no interpretador.

## 5.

Altere a linguagem para aceitar múltiplos parâmetros:

```
data Cmd = ...
         | Fun String [String] Cmd  -- n parametros

data Exp = ...
         | App String [Exp]         -- n argumentos
```

- Dica: Use `[1..n]` para criar uma lista de `1` até `n`: `[1,2,3,...,n]`.
