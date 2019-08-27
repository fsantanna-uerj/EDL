<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></p>        

Slide 10 - Funcional - Map/Filter/Foldr
=======================================

- Defina o **tipo** e a **implementação** de todos os valores e funções pedidos
  nos exercícios a seguir.
- Sempre que possível, use as funções `map`, `filter` e `foldr` (ou seja, não
  defina novas funções recursivas).

## Exemplos:


Considere a lista a seguir:

```
xs :: [Int]             -- isso é um valor
xs = [1,2,3,4]
```

### Map

Considere a função `duplica` a seguir:

```
duplica :: Int -> Int   -- isso é uma função
duplica n = n * 2
```

A lista `ys` contém os elementos de `xs` todos duplicados:

```
ys :: [Int]             -- isso é um valor
ys = map duplica xs
```

### Filter

Considere a função `maior2` a seguir:

```
maior2 :: Int -> Bool   -- isso é uma função
maior2 n = n > 2
```

A lista `zs` contém os elementos de `xs` maiores que `2`:

```
zs :: [Int]             -- isso é um valor
zs = filter maior2 xs
```

### Foldr

O valor a seguir é a soma de todos os elementos de `xs`:

```
n :: Int                -- isso é um valor
n = foldr (+) 0 xs
```

A função a seguir recebe uma lista e retorna a soma de todos os seus elementos:

```
soma :: [Int] -> Int    -- isso é uma função
soma vs = foldr (+) 0 vs

m :: Int                -- isso é um valor
m = soma xs -- teste da funcao passando a lista xs
```

-------------------------------------------------------------------------------

## 1.

1. Crie um valor `pares` que guarde os elementos pares de `xs`.
2. Crie um valor `incs` que guarde os incrementos dos elementos de `xs`.
3. Crie uma função `dups` que receba uma lista e retorna os seus valores
   duplicados.
4. Crie um valor `maior` que guarde o maior valor de `xs`.
5. Crie uma função `menor` que receba uma lista e retorne o seu valor menor.

## 2.

Considere uma turma de 50 alunos.
Cada aluno possui duas notas.
O aluno que ficou com média maior ou igual a cinco é considerado aprovado.

Considere um exemplo de uma turma:

```
turma1 :: [ (String,Float,Float) ]
turma1 = [ ("Joao",7.5,3.5), ("Maria",10.0,8.0), ("Jose",5.0,3.0), ... ] -- 50 alunos
```

Considere as funções a seguir para acessar o nome e as notas de um aluno:

```
nome :: (String,Float,Float) -> String
nome (nm,_,_) = nm

nota1 :: (String,Float,Float) -> String
nota1 (_,n1,_) = n1

nota2 :: (String,Float,Float) -> String
nota2 (_,_,n2) = n2
```

Considere a função `medias` que recebe uma turma e retorna uma lista com as
médias de todos os alunos:

```
media :: (String,Float,Float) -> Float
media aluno = ((nota1 aluno) + (nota2 aluno)) / 2

medias :: [ (String,Float,Float) ] -> [Float]
medias turma = map media turma
```

1. Crie um valor `notas1` com todas as primeiras notas de todos alunos de `turma1`.

```
notas1 :: [Float]
notas1 = <complete>             -- (ex., [5.5, 9.0, 4.0, ...])
```

2. Crie uma função `oitos` que receba uma turma e retorne os nomes dos alunos
   que tiraram acima de 8 (inclusive) nas **duas** notas.

```
oitos :: [ (String,Float,Float) ] -> [String]
oitos turma = <complete>        -- (ex., ["Maria", ...])
```

3. Crie uma função `todas` que receba uma turma e retorne uma
Tripla com a média de todas as P1, média de todas as P2 e médias de todas as
P1+P2:

```
todas :: [ (String,Float,Float) ] -> (Float, Float, Float)
todas turma = <complete>        -- (ex., (7.5, 4.8, 6.1))
```

4. Crie um valor `baixas` com todas as notas (P1 ou P2) abaixo de 5
   (inclusive):

```
baixas :: [Float]
baixas = <complete>             -- (ex., [3.5, 5.0, 3.0])
```

5. Crie uma função `pretty` que receba uma turma e retorne uma string no
   formato *"nome media (resultado)"*:

```
pretty :: [ (String,Float,Float) ] -> String
pretty turma = <complete>
```

Ex.:

```
Joao 5.5 (aprovado)
Maria 9.0 (aprovado)
Jose 4.0 (reprovado)
...
```

## 3.

Considere as definições a seguir:

```
bandas :: [[String]]
bandas = [ ["Gilberto Gil"],
           ["Victor","Leo"],
           ["Gonzagao"],
           ["Claudinho","Bochecha"] ]

musicas :: [(String, Int, Int)]
musicas = [ ("Aquele Abraco",       1, 100),
            ("Esperando na Janela", 1, 150),
            ("Borboletas",          2, 120),
            ("Asa Branca",          3, 120),
            ("Assum Preto",         3, 140),
            ("Vem Morena",          3, 200),
            ("Nosso Sonho",         4, 150),
            ("Quero te Encontrar",  4, 100) ]
```

Defina os valores a seguir:

1. Somente o nome das músicas:
    - `["Aquele Abraco", "Esperando na Janela", ...]`
2. Somente músicas com >= 2min:
    - `[("Esperando...",1,150), ("Borboletas",2,120), ... ]`
3. Maior duração:
    - `200`
4.  Nomes com >= 2min:
    - `["Esperando...", "Borboletas",, ... ]`
5.  Pretty-print música:

```
Nome: Borboletas
Autores: Victor, Leo
Duracao: 120
... 
```
