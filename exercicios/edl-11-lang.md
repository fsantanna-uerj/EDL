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
    - `1 + 10 - 20`
    - `1 + (10 - 20)`
    - `(5 + 5) - (5 - 5)`

- Escreva e calcule as expressões correspondentes aos seguintes valores:
    - `e1 = Add (Add (Add 1 2) 3) 4`
    - `e2 = Add 1 (Add 2 (Add 3 4))`
    - `e3 = Sub (Sub (Sub 1 2) 3) 4`
    - `e4 = Sub 1 (Sub 2 (Sub 3 4))`
    - `e5 = Sub (Sub 1 2) (Sub 3 4)`

- Defina a função `avalia` que recebe uma expressão e retorna o valor inteiro
  correspondente a sua avaliação.

- Em vez de retornar um inteiro, defina a função `avalia'` que retorna a
  expressão reduzida a um caso `Num`, e.x:
    - `avalia (Add (Num 1) (Num 2)` `-->` `Num 3`

## 2.

- Adicione as operações de multiplicação e divisão ao exercício `1`.
    - Redefina a representação
    - Redefina as funções `avalia` e `avalia'`
