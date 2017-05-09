Elm
===================

Elm é uma linguagem funcional pura e reativa que assim como algumas outras linguagens web modernas, é compilada para 
Javascipt, Html e CSS. Elm tem o objetivo de fazer da programação client-side (front-end) uma boa experiência, sendo 
uma linguagem simples e  fácil de usar.

Origem
-------------
 A linguagem foi criada como um trabalho de conclusão da curso de graduação de 
Evan Czaplicki e teve seu lançamento em abril de  2012. Ele como amante da programação funcional começou este projeto afim 
de trazer a programação funcional, uma maior escalabilidade e mais facilidade de manutenção para dentro do mundo do 
desenvolvimento web. Sua evolução se dá tanto pelas empresas onde Evan trabalha, como Prezi e NoRedInk, quanto pelo apoio da 
comunidade na forma de módulos.

Influências
-------------
Haskell, Standart-ML, OCaml

Classificação
-------------
Elm trás as seguintes características como diferencial das liguagens web:

- **Funcional Pura**: Uma linguagem pura trás maior facilidade de refatoração e diminui a possibilidade de efeitos 
colaterais no código.

- **Tipagem forte**: Um sistema forte de tipagem oferece uma previsibilidade maior para o código, ajuda o desenvolvedor leitura 
e também na análise do compilador.

- **Estrutura de dados persistente**: Uma estrutura de dados persistente faz com que uma vez definido um objeto seu valor não 
pode mais ser alterado. O que se pode fazer é retornar um novo objeto com os valores modificados. Isso dá ao programa maior 
previsibilidade e estabilidade, deixando menos propenso a efeitos colaterais.


Por que Elm ?
-------------
Elm é  projetada com  o objetivo de entregar uma melhor experiência para o desenvolvedor de aplicações web (client-side), 
sendo uma 
linguagem escalável e sem erros em tempo de execução. Hoje Elm conta com uma arquitetura própria de desenvolvimento, chamada 
de "Elm 
Archtecture", que apresenta um padrão de projeto modular e que promove o reuso de seus componentes. O desenvolvimento da linguagem também 
tem o objetivo de com o tempo oferecer novas ferramentas para quem a usa, como por exemplo:

-  **Compilador inteligente** : O compilador de Elm é uma ferramenta amigável, agindo mais como um assistente, não só dando 
com mais 
detalhes o erro ocorrido mas também tentando dar sugestões de como consertar o ocorrido;
- **Time Travel Debugger**: Uma ferramenta que grava e re-simula cada estado da aplicação durante a execução do código para 
melhor 
visualização do que ocorre em seu programa;
- **Gerenciador de pacotes**;
- **Editor Online**;
- **REPL**;
- **Interpolação com HTML, CSS e Javascript**;


Avaliação comparativa
-------------

A melhor linguagem para se comparar Elm é Javascript, já que as duas compartilham o mesmo nicho de desenvolvedores.

Segue a tabela:

Javascript     | Elm
-------- | ---
`function(x, y) { return x + y; }` | `\x y -> x + y`
`Math.max(3, 4)`    | `max 3 4`
`numbers.map(Math.sqrt)`    | `List.map sqrt numbers`
`return 2 + 2`    | `2 + 2`


Como podemos ver na primeira linha, Elm é uma linguagem que facilita tanto a leitura quanto a escrita através de uma sintaxe 
que evita o uso de símbolos e palavras da sintaxe ao escrever o código. Isso também proporciona uma maior unirfomidade no como os 
desenvolvedores escrevem, dando menos liberdade no posicionamento dos símbolos da linguagem. 
Para a maioria das definições só se precisa no máximo de alguns  símbolos, como `\` para declaração de funções anônimas e espaço para 
separar os parâmetros. Além disso, em Elm não há como declarar o retorno de uma função, pois tudo na linguagem é uma expressão.

Mais um exemplo:

```javascript
// Javascript
var point = {x:3,y:4}
var newPoint = [point,{x:2,y:4}].map(function(element){
	return element.x
})
```
```elm
//Elm
point = { x = 3, y = 4 }
newPoint = List.map .x [point,{x=0,y=0}] 

```

Outro diferencial nesta linguagem é a interpolação com HTML, CSS e Javascript.
Enquanto em javascript, podemos no máximo colocar todos os códigos no mesmo arquivo, em Elm eles se comunicam como um só, 
possibilitando 
a manipulação de objetos do HTML como funções, o cidadão de primeira classe da linguagem.

```html
// Javascript + HTML
<!DOCTYPE html>
<html><head><title>TODO list</title></head>
<body>
	<h3>A fazer</h3>
	<input placeholder="Todo" id="taskBox">
	<h3>Feito</h3>
	<ul id="list">
		
	</ul>
	<button onclick="addTask()">Add Message</button>
	<script>
		var doc = document;
		function addTask(){
			var text = doc.getElementById("input").value;
			var textNode = doc.createTextNode(text);
			var newElement = doc.createElement("li");
			newElement.append(textNode);
			doc.getElementById("list").appendChild(newElement);
		}
	</script>
</body></html>
```
```elm
//Elm
import Html exposing (Html, button, div, text, br, input, ul, li, h1, h3)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import String


{- Em Elm todo programa tem a função main, que é o ponto de entrada do programa. No caso, usamos a Beginner Program, que recebe três 
argumentos: o Model, o Update e a View 
-}
main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
{- Na função Model definimos os dados que usaremos e suas estruturas , é o estado do programa. -}
type alias Model = {
  to_do_list: List String,
  taskInput: String
}

model : Model
model = Model [] ""

-- UPDATE
{- Em Update definimos como o programa se comportará mediante as mensagens recebidas da view de acordo com as interações do usuário com o 
programa, assim o Update trabalha o model e retorna um novo alterado. -}

type Msg = ListenChange String | AddTask

-- Define a função update, que recebe uma Msg e um Model, e retorna um novo Model
update : Msg -> Model -> Model
update msg model =
  case msg of
  
	-- recebe uma cópia do model, altera o campo taskInput e retorna um novo model
    ListenChange taskBoxContent ->  {model| taskInput = taskBoxContent }
    
    -- recebe uma cópia do model, altera inclui a nova task na array e retorna um novo model
    AddTask -> {model| to_do_list = List.append model.to_do_list [model.taskInput]}

-- VIEW
{- Em View definimos o como nossa aplicação aparecerá para o usuário, importando elementos do HTML e CSS como funções do Elm e 
manipulando-as para desenhar o programa na tela. -}

--Aqui definimos uma função que recebe lst e retorna uma nova li para cada element
render_to_do lst= 
    List.map (\element -> li [] [text element]) lst

view : Model -> Html Msg
{- Definimos view como uma função que retorna funções HTML. A maioria delas recebe como argumentos: primeiro seus atributos, 
como id e 
class, e como segundo seus filhos. -}
view model =
  div []
    [ 
      h3 [] [ text "A fazer"]
    , input [ placeholder "Todo" ,id "taskBox", onInput ListenChange] []
    , h3 [] [ text "Feito"]
    {- abaixo temos uma ul que recebe [id "list"] como primeiro argumento, e como segundo a função que definimos anteriormente,
     passando 
    como argumento a lista dentro do model -}
    , ul [id "list"] (render_to_do model.to_do_list)
    , button [ onClick AddTask] [text "Add Message"] 
    ]
```

Conclusão
-------------

Elm é uma linguagem nova, cheia de recursos e peculiaridades, seja em sua sintaxe ou na forma como se desenvolve,  e por isso 
ainda tem 
um grande caminho a percorrer antes de deixar de ser uma linguagem para entusiastas e se tornar expressiva no ambiente 
front-end, já tão 
concorrido. 
O fato de ser pensada para agradar o desenvolvedor é sem dúvida um diferencial, pois trás ferramentas inovadoras para quem a 
usa e também 
um processo de desenvolvimento menos frustrante para aqueles que não são acostumados com linguagens tão dinâmicas como o 
javascript.





Fontes
-------------
http://evan.czaplicki.us/

http://elm-lang.org

https://en.wikipedia.org/wiki/Elm_(programming_language)

http://elm-lang.org/blog/blazing-fast-html-round-two

http://www.elmbark.com/2016/03/16/mainstream-elm-user-focused-design

https://github.com/izdi/elm-cheat-sheet

