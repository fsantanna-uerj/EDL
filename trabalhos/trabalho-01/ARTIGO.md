#COBOL

![](http://www.fti.com.br/Content/images/cobolBanner.png)


##Introdução

Este texto será um breve artigo sobre o **COBOL**, uma das primeiras linguagens de alto nível, orientada para o processamento de banco de dados comerciais, muito estruturada, com implementações como orientação a objeto, mas com um grande _skill gap_.

##História 

O **COBOL** (**Co**mmon **B**usiness **O**riented **Language**) foi desenvolvido em 1959 como resultado de uma conferência, a CODASYL (_Conference on Data Systems Language_) na [Universidade da Pensilvânia](https://pt.wikipedia.org/wiki/Universidade_da_Pensilv%C3%A2nia) na qual o Departamento de Defesa dos Estados Unidos concordou em custear e supervisionar as próximas atividades. Como resultado, em maio de 1959 uma reunião realizada no Pentágono votou pela criação de três comitês de desenvolvimento, um de curto, um de médio e um de longo prazo. 

As comissões foram contituídas por membros representantes de seis fabricantes de computadores e três orgãos do governo:

* [Burroughs Corporation](http://www.burroughs.com/)
* [IBM](http://www.ibm.com/br-pt/)
* [Minneapolis-Honeywell](http://www.honeywell.com/who-we-are/our-history)
* [RCA](http://www.computerhistory.org/brochures/companies.php?alpha=q-s&company=com-42bc220794e22)
* [Sperry Rand](http://www.computerhistory.org/brochures/companies.php?alpha=q-s&company=com-437cd904f1a80)
* [Sylvania Electric Products](https://www.sylvania.com/en-us/about/Pages/history.aspx)
* Força Aérea dos Estados Unidos
* David Taylor Model Basin
* Agência Nacional de Padrões 

Embora criadas três comissões, somente o comitê de curto prazo chegou a ser formado e que veio, meses após, a desenvolver as primeiras especificações do **COBOL**. O primeiro compilador para **COBOL** foi implementado no início de 1960 e em  7 de dezembro, essencialmente o mesmo programa **COBOL** funcionou em dois computadores diferentes, um computador RCA e uma Remington-Rand [Univac](https://pt.wikipedia.org/wiki/UNIVAC), demonstrando que a compatibilidade podia ser alcançada.

##Influências

O **COBOL** teve suas especificações inspiradas principalmente em duas linguagens, o **Flow-Matic** de Grace Hopper e o COMTRAN, uma linguagem de programção da IBM.

* **Flow-Matic**: No final de 1953, [Grace Hopper](https://pt.wikipedia.org/wiki/Grace_Hopper) percebeu que a notação matemática nas linguagnes de programção não era muito cômoda, então em 1955, ela e sua equipe começaram a desenvolver as especificações do Flow-Matic tendo como principal foco a reestruturação de palavras-chave usadas em programação para inglês. O projeto que foi concluído em 1959 também foi a primeira linguagem a distinguir de forma nítida as operações escritas no código.

Exemplo de código simples escrito em **Flow-Matic**:

```COBOL
INPUT INVENTORY FILE-A PRICE FILE-B ; OUTPUT PRICED-INV FILE-C UNPRICED-INV
FILE-D ; HSP D .
COMPARE PRODUCT-NO (A) WITH PRODUCT-NO (B) ; IF GREATER GO TO OPERATION 10 ;
IF EQUAL GO TO OPERATION 5 ; OTHERWISE GO TO OPERATION 2 .
TRANSFER A TO D .
WRITE-ITEM D .
JUMP TO OPERATION 8 .
TRANSFER A TO C .
MOVE UNIT-PRICE (B) TO UNIT-PRICE (C) .
WRITE-ITEM C .
READ-ITEM A ; IF END OF DATA GO TO OPERATION 14 .
JUMP TO OPERATION 1 .
READ ITEM B ; IF END OF DATA GO TO OPERATION 12 .
JUMP TO OPERATION 1 .
SET OPERATION 9 TO GO TO OPERATION 2 .
JUMP TO OPERATION 2 .
TEST PRODUCT-NO (B) AGAINST ZZZZZZZZZZZZ ; IF EQUAL GO TO OPERATION 16 ;
OTHERWISE GO TO OPERATION 15 .
REWIND B .
CLOSE-OUT FILES C ; D .
STOP . (END)
```

* **COMTRAN** : o COMTRAN (COMercial TRANslator) é uma linguagem própria da IBM desenvolvida em 1957 por Bob Bemer, a linguagem continha pela primeira vez um elemento chamado **Picture Clause** que em particular definia o tamanho e tipo de quaisquer dados. 

Um dos computadores COMTRAN ([Imagem.](http://i.imgur.com/EY2WmtT.jpg?1))

##Processo Evolutivo

* **ANS COBOL 1968** : Depois de 1959 o COBOL sofreu várias modificações e melhorias. Na tentativa de superar o problema da incompatibilidade entre diferentes versões de COBOL, o _American National Standards Institute_ (ANSI) desenvolveu uma forma padrão de língua, em 1968, após o lançamento da versão COBOL-61 que se tornou a pedra angular para mais versões. Esta versão ficou conhecida como _American National Standard_ (ANS) COBOL.

* **COBOL 1974** : A ANSI publicou em uma revista(1974) essa versão do COBOL que continha uma série de recursos novos e correções.

* **COBOL 1985** : Em 1985 a ANSI ainda publicou outra edição que implementava terminadores de escopo,  incluindo **_END-IF_**, **_END-PERFORM_**, **_END-READ_**, etc.

* **COBOL 2002 (oo)** : No início de 1990, decidiu-se acrescentar a orientação a objetos na próxima revisão completa do COBOL. Em 1997 foi concluída uma revisão do COBOL que serviu de rascunho para a introdução da orientação a objeto, ficando disponível em [padrão ISO](https://www.ansi.org/standards_activities/iso_programs/overview.aspx?menuid=3) em 2002.

O COBOL 2002 incluiu recursos além orientação a objetos:

* Suporte a idiomas (incluindo, mas não limitado a suporte ao Unicode)
* Processamento baseado em Locale
* Funções amigáveis ao usuário
* CALL (e função) protótipos (para a verificação de parâmetro em tempo de compilação)
* Ponteiros e sintaxe para a obtenção/liberação de armazenagem
* Convenções de chamada de e para línguas não-COBOL, como C
* Suporte para execução em ambientes estruturas como .NET e Java (incluindo COBOL instanciado como Enterprise JavaBeans)
* Suporte a Bit e Bool
* Suporte a "True" (até esta melhoria, itens binários eram truncados (pela especificação de base-10) dentro da DATA DIVISION)
* Suporte a ponto flutuante
* Resultados aritméticos padrão (ou portáteis)
* Geração e parsing de XML

##Estruturação

O COBOL é uma das linguagens mais estruturadas usadas até hoje em diversos sistemas econômicos pelo mundo. No COBOL há três tipos básicos de dados que podem ser usados em instruções:

* Numérico (decimal ou inteiros)
* Alfanumérico
* Constantes figurativas

O procedimento do COBOL também consiste basicamente em quatro divisões separadas:

1. **_IDENTIFICATION DIVISION_**: possui informações documentais, como nome do programa, quem o codificou e quando essa codificação foi realizada.

2. **_ENVIRONMENT DIVISION_**: descreve o computador e os periféricos que serão utilizados pelo programa.

3. **_DATA DIVISION_**: descreve os arquivos de entrada e saída que serão usadas pelo programa. Também define as áreas de trabalho e constantes necessárias para o processamento dos dados.

4. **_PROCEDURE DIVISION_**: contém o código que irá manipular os dados descritos na DATA DIVISION. É nesta divisão que o desenvolvedor descreverá o algoritmo do programa.

Exemplo: 
```COBOL
IDENTIFICATION DIVISION
  ENVIRONMENT DIVISION
    * CONFIGURATION SECTION
    * INPUT-OUTPUT SECTION 
  DATA DIVISION
    * FILE SECTION
    * WORKING-STORAGE SECTION
    * LOCAL-STORAGE SECTION
    * LINKAGE SECTION
    * COMMUNICATION SECTION
    * REPORT SECTION
    * SCREEN SECTION 
  PROCEDURE DIVISION
```
##Exemplo Comparativo

###Hello World
  
Como o COBOL é uma das linguagens mais estruturadas da atualidade, pode-se imaginar as diferênças entre ele e uma outra linguagem mais dinâmica e _short-formed_ como Java.

**Java:** 
```Java
public class HelloWorld {

    public static void main(String[] args) {
        System.out.println("Hello, World");
    }

}
```

**COBOL:**
```COBOL
  IDENTIFICATION DIVISION.
      PROGRAM-ID. HELLO-WORLD.
      PROCEDURE DIVISION.
          DISPLAY 'Hello, World'.
          STOP RUN.
```

###Análise

 * **Readability**: Quando se discute a leitura de um código em COBOL, geralmente duas vertentes são defendidas, há quem diga, por exemplo, que a forte tipagem e as funções bem estruturadas fazem do COBOl uma das linguagens mais fáceis de se compreender, outros, por outro lado, afirmam que a forma bruta de escrita e tipagem fazem dele uma linguagem de difícil compreensão.
 
 * **Writability**: Como o COBOL é uma linguagem baseada na língua inglesa, as funções e os recursos requerem um conhecimento de inglês, sua estruturação em divisões faz com que a escrita precise ser emparelhada e ordenada dando um ar mais pesado a linguagem.
 
 * **Expressiveness**: Como o COBOL é uma linguagem antiga, sua expressividade, quando comparada comparada com outras lingaugem mais atuais, como Java, aparenta passada. Também a estrutura e tipagem do COBOL em relãção a linguagem orientadas a objetos denotam uma expressividade baixa e carente de atualizações, que é realmente um reflexo de uma linguagem de mais de 50 anos.  

##Conclusão

O COBOL, apesar de ser a 18ª linguagem mais usada, atualmente enfrenta problemas como o custo de se manter um [Mainframe](https://pt.wikipedia.org/wiki/Mainframe) e a dificuldade de se migrar os dados para sistemas não dependentes, algumas empresas até oferecem serviços desse tipo ([Aqui.](http://www.cobol-it.com/)). A verdade é que o [_skill-gap_](http://blog.hackerrank.com/wp-content/uploads/2015/07/COBOL-knowledge-skill-gap-3.png), ou seja, o número de pessoas que estão aprendendo a usar COBOL relacionado com a demanda de profissionais na área não é favorável, mostrando a eminência de uma reestruturação funcional. E apesar dos dados não serem os melhores, a IBM já anunciou planos de desenvolvimento em COBOL para os próximos [50 anos](https://www.youtube.com/watch?v=JLMqkuou2-s), o que pode significar que ainda teremos contato com o COBOL.

![COBOL](https://1.bp.blogspot.com/-k8Lb2XeAARA/VxlxJZ5vX3I/AAAAAAAARrM/kuLTUZq8Zhc-8hvLWWi01uk5BY9fUcS0wCLcB/s1600/BANNER.jpg)

##Bibliografia

* http://blog.hackerrank.com/the-inevitable-return-of-cobol/
* https://pt.wikipedia.org/wiki/COMTRAN
* https://pt.wikipedia.org/wiki/Flow-Matic
* https://pt.wikipedia.org/wiki/COBOL
* https://prezi.com/a5ntqhnawffv/linguagem-de-programacao-cobol/
* https://pt.wikipedia.org/wiki/COBOL#COBOL_2002_e_o_COBOL_orientado_a_objeto
* https://pt.wikipedia.org/wiki/UNIVAC_I


