Elm
===================

Elm é uma linguagem funcional pura e reativa que assim como algumas outras linguagens web modernas, é compilada para Javascipt, Html e CSS. Elm tem o objetivo de fazer da programação client-side (front-end) uma boa experiência, sendo uma linguagem simples e  fácil de usar.



Origem
-------------
 A linguagem foi criada como um trabalho de conclusão da curso de graduação de 
Evan Czaplicki e teve seu lançamento em abril de  2012. Ele como amante da programação funcional começou este projeto afim de trazer a programação functional, uma maior escalabilidade e  mais facilidade de manutenção para dentro do mundo do desenvolvimento web.
Sua evolução se dá tanto pelas empresas onde Evan trabalhoa, como Prezi e NoRedInk, quanto pelo apoio da comunidade na forma de módulos.


Influências
-------------
Haskell, Standart-ML, OCaml

Classificação
-------------
Elm trás as seguintes características como diferencial das liguagens web:

-**Tipagem forte**: Um sistema rígido de tipagem oferece uma form

 uma linguagem funcional pura e reativa, com tipagem forte e estrutura de dados persistente (ou imutável).


Por que Elm ?
-------------
Elm é  projetada com  o objetivo de entregar uma melhor experiência para o desenvolvedor de aplicações web (client-side), sendo uma linguagem escalável e sem erros em tempo de execução. Hoje, Elm conta com uma arquitetura própria de desenvolvimento, chamada de "Elm Archtecture", que apresenta um padrão de projeto modular e que promove o reuso de seus componentes. O desenvolvimento da linguagem também tem o objetivo de com o tempo oferecer novas ferramentas para quem a usa, como por exemplo:

-  **Compilador** : O compilador de Elm é ferramenta amigável, agindo mais como um assistente, não só dando com mais detalhes o erro ocorrido mas também tentando dar sugestões de como consertar;
- **Time Travel Debugger**: Uma ferramenta que grava e re-simula cada estado da aplicação durante a execução do código para melhor visualização do que ocorre em seu programa;
- **Gerenciador de pacotes**;
- **Editor Online**;
- **Interpolação com HTML, CSS e Javascript**;


Avaliação comparativa
-------------

A melhor linguagem para se comparar Elm é Javascript, já as duas compartilham o mesmo nicho de desenvolvedores.

Javascript     | Elm
-------- | ---
`function(x, y) { return x + y; }` | `\x y -> x + y`
`Math.max(3, 4)`    | `max 3 4`
`numbers.map(Math.sqrt)`    | `List.map sqrt numbers`

Como podemos ver na primeira linha, Elm é uma linguagem que facilita tanto a leitura quanto a escrita através de uma sintaxe que evita o uso de símbolos e palavras ao escrever o código. Isso também proporciona uma maior unirfomidade na forma como os desenvolvedores escrevem, dando menos liberdade no posicionamento dos símbolos da linguagem. 
Para a maioria das distinções só se precisa de alguns  símbolos, como `\` para declaração de funções anônimas e espaço para separar os parâmetros. Além disso, em Elm não há como declarar o retorno de uma função, pois tudo na linguagem é uma expressão.

Mais um exemplo:

```
// Javascript
var point = {x:3,y:4}
var newPoint = [point,{x:2,y:4}].map(function(element){
	return element.x
})

//Elm
point = { x = 3, y = 4 }
newPoint = List.map .x [point,{x=0,y=0}] 

```

Outro diferencial nesta linguagem é a interpolação com HTML, CSS e Javascript.
Enquanto em javascript, podemos no máximo colocar todos os códigos no mesmo arquivo, em Elm eles se comunicam como um só, possibilitando a manipulação de objetos do HTML como funções, o cidadão de primeira classe da linguagem.

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

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model = {
  to_do_list: List String,
  taskInput: String
}

model : Model
model = Model [] ""

-- UPDATE
type Msg = ListenChange String | AddTask

update : Msg -> Model -> Model
update msg model =
  case msg of
    ListenChange taskBoxContent ->  {model| taskInput = taskBoxContent }
    AddTask -> {model| to_do_list = List.append model.to_do_list [model.taskInput]}

-- VIEW
render_to_do lst= 
    List.map (\to_do -> li [] [text to_do]) lst

view : Model -> Html Msg
view model =
  div []
    [ 
      h3 [] [ text "A fazer"]
    , input [ placeholder "Todo" ,id "taskBox", onInput ListenChange] []
    , h3 [] [ text "Feito"]
    , ul [id "list"] (render_to_do model.to_do_list)
    , button [ onClick AddTask] [text "Add Message"] 
    ]
```


http://evan.czaplicki.us/

http://elm-lang.org

https://en.wikipedia.org/wiki/Elm_(programming_language)

http://elm-lang.org/blog/blazing-fast-html-round-two

https://www.youtube.com/watch?v=oYk8CKH7OhE

https://github.com/izdi/elm-cheat-sheet

