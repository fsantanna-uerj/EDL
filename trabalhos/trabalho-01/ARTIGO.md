#JavaScript
JavaScript é uma das linguagens de programação mais populares do mundo por seu papel como “linguagem de script embutida para o ambiente Web”. Porém, ela é uma excelente linguagem para usos gerais fora deste ambiente.    
  
####Origem
Inicialmente chamada de Mocha, JavaScript foi desenvolvida por Brendan Eich em 10 dias no ano 1995 enquanto trabalhava na Netscape. Ao longo de 1995 ela foi renomeada para LiveScript e então recebeu o nome atual, que sempre causou muita confusão por passar a impressão errada de que foi baseada em Java - sua única influência foi em alguns aspectos de sintaxe. A alteração no nome ocorreu na época em que a Netscape adicionou suporte à tecnologia Java em seu navegador. 
Netscape almejava uma linguagem interpretada mais leve para complementar Java e conseguir o interesse do público mais leigo, e então JavaScript surgiu.    
  
####Influências
Self, C, Lisp, Scheme, Perl, Python, Java    
  
####Classificação
É uma linguagem de script embutida orientada à eventos multi-paradigma baseada em protótipo que é dinâmica, com tipagem fraca e suporte aos estilos de programação orientado a objetos, estruturado, imperativo e funcional.    
  
####Comparação com outras linguagens
JavaScript não possui muitos concorrentes em seu uso mais frequente. É possível fazer por exemplo um programa para gerenciar lojas em Java, C ou Python, mas quando se trata de rodar uma linguagem dentro do navegador praticamente não há alternativas fora JavaScript. Flash pode ser uma alternativa, mas o desempenho de JS é muito superior devido à sua natureza de ser orientada à eventos.

JavaScript é uma linguagem mais fácil de se escrever devido à sua tipagem fraca. Não é necessário declarar os tipos de suas variáveis e ela tolera operações utilizando variáveis de tipos diferentes. Ela possui objetos, mas não requer declaração de classes. Sua facilidade de escrita é bem maior em relação à Java e C, por exemplo. Ela é mais fácil como Python e Ruby, mas JS é mais legível que Python e mais tolerante que Ruby, além de ter performance mais rápida que as duas.

JavaScript tem uma característica diferenciada que é poder rodar em navegadores (o que causa a existência de muitos interpretadores de JS diferentes), então não há como compará-la a outra linguagem neste aspecto. ActionScript é similar à ela pelo ECMAScript, o padrão de linguagens determinado pela ECMA International - um comitê que padroniza sistemas de computação, incluindo linguagens de programação. JavaScript e ActionScript são implementações deste padrão. Porém, mesmo fora do navegador ela tende a ter uma performance muito rápida por ser orientada à eventos.

Por ser assíncrona, JS não realiza as ações necessariamente em ordem síncrona. Quando JS encontra uma tarefa que depende de input/output ou similar, ela inicia a tarefa, associa eventos que serão ativos quando ela concluir/falhar/progredir, e continua processando outras tarefas. Em outras linguagens que são síncronas, você espera que as ações sejam terminadas antes dela ir para a próxima. “Blocking tasks” são tarefas que impedem a execução de outras tarefas enquanto estão sendo rodadas. JS não possui blockings tasks pois ele continuará executando tarefas sempre que viável.
Porém, justamente por ser assíncrona ela se torna mais ilegível do que outras linguagens, tornando sua manutenção mais trabalhosa.

JavaScript também pode ser usado junto com DOM (Document Object Model - uma interface de programação para documentos em HTML e XML) para gerar páginas da web e XMLs. O conteúdo da página fica armazenado no DOM e pode ser acessado e manuseado por JavaScript.    
  
#####Exemplos de código representativos

O famoso “Hello World!”:

```javascript
alert("Hello World!");
```

Uma função recursiva para calcular o fatorial de um número:

```javascript
function factorial(n) {
    if (n == 0) {
       return 1;
    }
    return n*factorial(n - 1);
}
```

Um objeto e suas propriedades:

```javascript
var person = {  
    firstName : “Alline”,  
    lastName  : “Coelho”,  
    age       : 21,  
    university  : “UERJ”  
};  
```

Um método assíncrono:

```javascript

/* Parse.get() é um método assíncrono. Não é viável pegar o resultado de Parse.get e guardar dentro de um variável, pois ele será nulo, já que o JS o executará depois.
>O código possui um método chamado getUserImages, do objeto Parse. Ele pega um usuário usando o método Parse.get, identifica a id dele e se o resultado não for válido ele retorna um erro. Se for válido, as imagens do perfil dele serão colocadas em um objeto, e as retorna. */

Parse.getUserImages = function(id, callback){
  var user = Parse.get(‘/users/‘+id).on(‘complete’, (data,response) => {
    var images = {
      profilePicSmall: data.profilePictureSmallFile.url,
      profilePicMedium: data.profilePictureMediumFile.url
    };
    callback(images);
  }).on(‘error’, (data, response) => callback(new Error(‘no cheating, kids’)));
}
```


JS sendo aplicado com HTML:


```
<!DOCTYPE html>

<html>
<body>

<h1>JavaScript in Body</h1>

<p id="demo">2+2 dá?</p>

<button type="button" onclick="myFunction()">Quatro</button>

<script>

function myFunction() {
    document.getElementById("demo").innerHTML = “prbns”;
}
</script>

</body>
</html> 
```
  
#####Conclusão
JavaScript é uma ótima linguagem de programação por rodar em diversos navegadores e ter suporte à diferentes paradigmas de programação. Ela tem incrível expressividade e desempenho dentro e fora de navegadores, como também é mais fácil de ser utilizada devido à sua tipagem fraca. Porém, sua legibilidade pode ser inferior à de outras linguagens pela sua natureza assíncrona, complicando a manutenção de seu código. Mas continua sendo uma excelente linguagem por todas suas vantagens.    
  
#####Bibliografia
https://developer.mozilla.org/pt-BR/docs/Web/JavaScript  
https://en.wikipedia.org/wiki/JavaScript  
https://en.wikipedia.org/wiki/Brendan_Eich  
http://javascript.crockford.com/javascript.html  
https://en.wikipedia.org/wiki/Ecma_International  
https://en.wikipedia.org/wiki/ECMAScript  
http://pt.stackoverflow.com/questions/16950/como-programa%C3%A7%C3%A3o-ass%C3%ADncrona-funciona-em-javascript  
https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction  
