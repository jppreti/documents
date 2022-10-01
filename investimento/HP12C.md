# HP12C

Trata-se da calculadora financeira mais conhecida mundialmente.

### Aonde baixar?

Você pode adquiri-la fisicamente, ou utilizando versões [Web](http://www.fazerfacil.com.br/calculadoras/hp12c.html) ou aplicativos para [Android](https://www.baixaki.com.br/android/download/emulador-hp-12c-free.htm) e [iOS](https://itunes.apple.com/br/app/touch-fin-rpn/id946171077?mt=8).

### Pré-requisitos

Vamos aprender como utilizá-la para os cálculos que vimos nos artigos [Juros Simples]() e [Juros Compostos]().

### Introdução

Primeiro vamos dar uma olhada na calculadora:

![HP12C](https://github.com/jppreti/documents/blob/main/investimento/images/HP12C.png?raw=true)

As teclas que mais iremos usar são essas demarcadas com um retângulo vermelho na área superior da calculadora.

Vejamos o que cada uma significa:

```
n   -> número de períodos  
i   -> taxa de juros  
PV  -> valor presente  
PMT -> prestações  
FV  -> valor futuro  
CHS -> troca sinal (+ -)
```

Como você pode ver são as nossas conhecidas dos artigos sobre [Juros]().

Entender o que cada uma significa já é mais de meio caminho andado para que possamos utilizar a calculadora.

Basta digitar o número e pressionar a tecla para indicar o que esse valor representa.

### Juros Compostos

Tomemos como exemplo um principal de **R$ 1.000,00** aplicado a **juros compostos** de **1% ao mês** pelo período de **10 meses**.

Faça o passo a passo na sua calculadora (Física, Web, Android ou iOS).

```
Passo 1: digite o número 10;  
Passo 2: pressione a tecla n (número de períodos);  
Passo 3: digite o número 1;  
Passo 4: pressione a tecla i (taxa de juros);  
Passo 5: digite o número 1000;  
Passo 6: pressione a tecla PV (valor presente);  
Passo 7: pressione a tecla FV.
```

Ao pressionar a tecla **FV** perceba que ele já apresenta o resultado para o **valor futuro** que é de **R$ 1.104,62**.

### Limitando o Valor da Aplicação

Como [já vimos](), existem CDBs que são protegidos pelo FGC até o limite de R$ 250.000,00.

Então se o FGC garante no máximo R$ 250.000,00, **qual o valor máximo devo aplicar** em um CDB de **5 anos** (60 meses) que paga **1% ao mês**?

Vamos ver o passo a passo na calculadora:

```
Passo 1: digite o número 60;
Passo 2: pressione a tecla n (número de períodos);
Passo 3: digite o número 1;
Passo 4: pressione a tecla i (taxa de juros);
Passo 5: digite o número 250000;
Passo 6: pressione a tecla FV (valor futuro);
Passo 7: pressione a tecla PV (valor presente).
```

Ao pressionar a tecla **PV** perceba que ele já apresenta o resultado para o **valor presente** que é de **R$ 137.612,40**.

Ou seja, você não deve ultrapassar **R$ 137.612,40** para que o montante acumulado ao final de 5 anos não ultrapasse os R$ 250.000,00 garantidos pelo FGC.

Percebeu que basicamente você fornece os dados que você conhece e no final basta pressionar a tecla do que você quer descobrir?

### Juros com Aportes Regulares

Até agora nossos cálculos levaram apenas em consideração um único aporte, que é o valor principal (valor presente).

Mas como ficaria o valor futuro caso eu realizasse aportes regulares?

Imagine que você queira saber quanto vai ter daqui a **20 anos** (240 meses) fazendo depósitos (aportes) mensais de **R$ 1.000,00** com juros de **1% ao mês**.

Esse cenário é o que muitos se deparam quando tentam projetar uma reserva financeira para a [aposentadoria]().

Vamos ver o passo a passo na calculadora:

```
Passo 1: digite o número 240;
Passo 2: pressione a tecla n (número de períodos);
Passo 3: digite o número 1;
Passo 4: pressione a tecla i (taxa de juros);
Passo 5: digite o número 1000;
Passo 6: pressione a tecla PMT (valor da prestação);
Passo 7: pressione a tecla FV (valor futuro).
```

Ao pressionar a tecla **FV** perceba que ele já apresenta o resultado para o **valor futuro** que é de **R$ 989.255,37**.

### Descobrindo o Valor dos Aportes

Um outro exemplo interessante é descobrir o valor das prestações para conseguir atingir um objetivo.

Por exemplo, imagine que você queira atingir a marca de **1 milhão** daqui **20 anos** (240 meses) e que você está projetando um rendimento de **1% ao mês** para suas aplicações.

Qual o valor dos **aportes mensais** que você deverá realizar para conseguir atingir o primeiro milhão?

Vamos ver o passo a passo na calculadora:

```
Passo 1: digite o número 240;
Passo 2: pressione a tecla n (número de períodos);
Passo 3: digite o número 1;
Passo 4: pressione a tecla i (taxa de juros);
Passo 5: digite o número 1000000;
Passo 6: pressione a tecla FV (valor futuro);
Passo 7: pressione a tecla PMT (valor da prestação).
```

Ao pressionar a tecla **PMT** perceba que ele já apresenta o resultado para o **valor da prestação** que é de **R$ 1.010,86**.

### Descobrindo o Juros Real

Outro exemplo interessante é aquele em que você quer descobrir o juros real.

Você sabe o valor principal (valor presente), sabe o valor da prestação e quer tirar a dúvida para saber se o juros é aquele informado.

Por exemplo, um carro de **R$ 40.000,00** sendo pago em **48** **prestações** de **R$ 1.200,00**.

Vamos ver o passo a passo na calculadora:

```
Passo 1: digite o número 48;
Passo 2: pressione a tecla n (número de períodos);
Passo 3: digite o número 40000;
Passo 4: pressione a tecla PV (valor presente);
Passo 5: digite o número 1200;
Passo 6: pressione a tecla CHS (trocar o sinal);
Passo 7: pressione a tecla PMT (valor da prestação);
Passo 8: pressione a tecla i (taxa de juros).
```

Ao pressionar a tecla **i** perceba que ele já apresenta o resultado para o **taxa de juros** que é de **1,6% (a.m.)**.

O Passo 6 faz-se necessário para trocar o sinal para negativo (-1200), indicando um abatimento da dívida.
