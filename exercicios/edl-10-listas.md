<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></p>        

Slide 10 - Funcional - Map/Filter/Foldr
=======================================

- Defina o **tipo** e a **implementação** de todas as funções pedidas nos
  exercícios a seguir.

## 1.

Considere a seguinte representação para árvores binárias:

```
data Arvore = Folha | Galho Arvore Arvore
```

- Desenhe as árvores correspondentes aos seguintes valores:
    - `a1 = Galho (Galho Folha Folha) (Galho Folha Folha)`
    - `a2 = Galho (Galho (Galho Folha Folha) Folha) Folha`
    - `a3 = Galho Folha (Galho (Galho Folha Folha) (Galho Folha Folha))`

- Defina a função `folhas` que recebe uma árvore e retorna a sua quantidade de
  folhas.

- Defina a função `altura` que recebe uma árvore e retorna a sua altura, ou
  seja, a maior distância entre a raíz e as folhas.
  (Uma árvore com apenas uma folha tem altura `0`).

- Defina a função `espelho` que recebe uma árvore e inverte as subárvores de
  todos os galhos (troca a esquerda com a direita).

## 2.

Considere a seguinte representação para árvores binárias:

```
data Arvore = Folha | Galho Int Arvore Arvore
```

- Redefina todas as funções do exercício `1` para funcionarem com essa nova
  representação.

- Defina a função `soma` que recebe uma árvore e retorna a soma de todos os
  valores guardados nos seus galhos.

- Defina a função `dobra` que recebe uma árvore e retorna uma nova árvore com
  todos os valores dos galhos originais duplicados.

- Defina uma função `possui` que recebe uma árvore e um valor e retorna se
  algum galho da árvore guarda esse valor.

- Considere ávores binárias de busca, ou seja, árvores em que os galhos à
  esquerda sempre guardam valores menores ou iguais que os galhos à direita.
    - Redefina a função `possui` de maneira mais eficiente que o exercício
      anterior.
    - Defina a função `maximo` que recebe uma árvore e retorna o seu maior
      valor.
    - Defina a função `insere` que recebe uma árvore e um valor e retorna uma
      nova árvore com esse novo valor, respeitando a propriedade de árvore de
      busca.

## 3.

- Crie uma nova representação de árvores que guarde valores nas folhas em vez
  de guardar nos galhos.

- Redefina todas as funções do exercício `2` para funcionarem com essa nova
  representação.

## 4.

- Baseado no exercício `2`, crie uma nova representação que guarde nos galhos
  qualquer tipo de dados, ou seja, não necessariamente inteiros.

- Redefina todas as funções do exercício `2` para funcionarem com essa
  nova representação.
    - Quais funções deixaram de funcionar? Por quê?
    - Adicione os prefixos `Num a =>` ou `Ord a =>` (ou ambos) nos exercícios
      que não funcionaram e verifique se é possível fazer com que todos
      funcionem.

- Defina uma função `mapA` com o seguinte tipo:
    - `mapA :: (a -> b) -> Arvore a -> Arvore b`
    - A função deve mapear todos os valores de uma árvore para uma nova árvore,
      usando uma função de mapeamento.
    - Crie pelo menos `3` exemplos interessantes de uso dessa função.

- Defina uma função `foldA` com o seguinte tipo:
    - `foldA :: (a -> b -> b) -> b -> Arvore a -> b`
    - A função deve fazer um *fold* de todos os valores guardados na árvore
      recebida com a função passada e a partir de um acumulador inicial também
      recebido.
    - Crie pelo menos `3` exemplos interessantes de uso dessa função.
