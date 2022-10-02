# Conhecendo as Operações do Home Broker (HB)

## O que é?

É uma ferramenta que lhe permite negociar (enviar ordens de compra e/ou venda) ativos da bolsa de valores (B3) via Internet.

Para fins de exemplo prático, utilizarei o home broker da modalmais, mas sem nenhuma recomendação, apenas uma escolha dentre as [4 corretoras]() que tenho conta.

Os conceitos e termos que serão apresentados neste artigo são suficientes para que consiga entender o home broker de outras corretoras.

## Localizando o Home Broker

No caso da modalmais o home broker fica localizado no menu “Bolsa de Valores”. A localização do home broker nas outras corretoras também é simples.

![](https://github.com/jppreti/documents/blob/main/investimento/images/HomeBroker.png)

Localização do Home Broker

Ao abrir o home broker teremos duas janelas principais que podem ser visualizadas na figura abaixo:

![](https://github.com/jppreti/documents/blob/main/investimento/images/Ordem_Livro.png?fit=750%2C210)

Janela de **Ordem** e Janela de **Livro de Ofertas**

A janela da esquerda é a de **ORDEM**, responsável pelo envio da sua ordem de compra ou venda. A janela da direita é a do **LIVRO DE OFERTAS**, responsável por exibir as ordens de compra e venda que estão em **aberto**.

Quando você envia uma ordem de compra ou venda utilizando a janela da esquerda, a sua ordem é contabilizada na janela da direita, sendo visível para todos os investidores. Vamos entender cada uma delas.

## Livro de Ofertas

O livro de ofertas exibe todas as ofertas (compra e venda) que estão em aberto. Perceba na imagem abaixo que temos duas áreas: uma em cor amarela que representa as ordens de compra e outra em cor azul que representa as ordens de venda.

Se estiver em dúvida é fácil descobrir, perceba que a área da esquerda apresenta preços mais baixos em relação à da direita. Investidores interessados em comprar oferecem preços mais baixos, querem comprar mais barato, enquanto os investidores interessados em vender oferecem preços mais altos, querem vender pelo maior valor possível.

![](https://github.com/jppreti/documents/blob/main/investimento/images/LivroOfertas.png)

Livro de Ofertas

Essas ordens estão em aberto porque ainda não apareceu um comprador interessado em pagar R$ 107,64 ou um vendedor interessado em vender por R$ 107,51.

Isso quer dizer que se você não quiser esperar para comprar, deverá pagar pelo menos R$ 107,64, ou se não quiser esperar para vender, deverá vender por R$ 107,51, chamamos isso de **ordem a mercado**.

## Ordem

Vamos supor que você queira **comprar 675** **cotas** do fundo MALL11. Perceba que **ao preço de R$ 107,64 existem 665 cotas** (500 sendo vendidas pela corretora XP e 165 pela corretora Itaú), para completar as 675 cotas você terá que comprar **10 cotas ao preço de R$ 107,80** sendo vendidas pela Clear.

Ao **clicar na linha** da Clear que está vendendo **10 cotas a R$ 107,80**, perceba que a ferramenta já preenche a ordem de compra com uma quantidade de **675 cotas ao preço de R$ 107,80**. Veja o resultado abaixo:

![](https://github.com/jppreti/documents/blob/main/investimento/images/OrdemCompra.png)

Ordem de Compra

O home broker já é esperto o suficiente para entender que **não é que você quer comprar pagando mais caro** (R$ 107,80), mas sim que **só as cotas a R$107,64 não serão suficientes** e por isso ele soma as cotas com preços inferiores.

Não se preocupe em achar que você estará pagando mais caro por isso (675 cotas * 107,80), aqui também a bolsa faz a negociação que é melhor para você, ou seja, mesmo que a ordem seja de 675 cotas a R$ 107,80, de acordo com o livro de ofertas, a bolsa irá executar a ordem de compra de 665 cotas a R$ 107,64 e 10 cotas a R$ 107,80. O resultado final é um preço pago de R$ 107,6423 por cota. O valor correto aparecerá no resultado da execução e na nota fiscal.

**A mesma coisa acontece com o processo de venda**. **Vamos supor que você queira vender 60 cotas de MALL11.**

Ao **clicar na linha** da XP que está vendendo **48 cotas a R$ 107,50**, perceba que a ferramenta já preenche a ordem de compra com uma quantidade de **60 cotas ao preço de R$ 107,50**. Veja o resultado abaixo:

![](https://github.com/jppreti/documents/blob/main/investimento/images/OrdemVenda.png)

Ordem de Venda

Novamente o home broker entende que **não é que você quer vender mais barato do que precisa** (R$ 107,50), mas sim que **só as cotas a R$107,51 não serão suficientes** e por isso ele soma as cotas.

Aqui também você não precisa se preocupar em achar que estará vendendo mais barato (60 cotas * 107,50), de acordo com o livro de ofertas, a bolsa irá executar a ordem de venda de 2 cotas a R$ 107,51 e 58 cotas a R$ 107,50.

Mas **você não precisa seguir a sugestão de quantidades e valores preenchidos pela ferramenta**. Você pode informar a quantidade que quiser e o valor que estiver disposto a vender ou comprar. Essa sua ordem entrará no livro de ofertas aguardando algum comprador ou vendedor interessado.

Mas por quanto tempo essa ordem ficará disponível no livro de ofertas? Para isso perceba que acima do código do ativo (papel) temos o campo **Tipo** que possui 4 opções:

- **Válida para hoje (DIA)**: são ordens que exigem o preenchimento do preço e só executam em condições melhores ou iguais as definidas, tem validade somente para o dia. A ordem entrará no livro de ofertas hoje e ao final do dia, se não for executada, a mesma será cancelada.
- **Válida até a data (DES)**: a ordem fica valida até a data indicada pelo cliente, podendo ficar no livro de ofertas por vários dias, semanas,…
- **Válida até cancelar (VAC)**: sem prazo definido, enquanto não bater o preço estipulado, a ordem não será cancelada. Deve ser cancelada pelo cliente quando desejar.
- **Executa ou cancela (EOC)**: se a ordem não for executada, a própria Bolsa faz o cancelamento. Esse tipo de ordem executa no momento em que foi enviada pelo que estiver disponível no livro de ofertas, se não puder ser executada ela é cancelada.

Configurada a ordem de compra ou venda (tipo, papel, quantidade e preço), preencha a sua assinatura digital (senha do home broker) e clique em comprar ou vender.

A ordem que você enviou poderá ser acompanhada na janela abaixo. **Verifique o status** (se executada ou não) e pode até **cancelar** se desejar (caso a ordem ainda não tenha sido executada).

![](https://github.com/jppreti/documents/blob/main/investimento/images/OrdemAcompanhamento.png?fit=750%2C79)

Janela para acompanhamento de ordens

Existem outros tipos de ordens como as ordens de stop loss, gain e móvel, mas essas são ordens normalmente utilizadas por traders. Traders são investidores especuladores que ganham com a compra e venda de ações (day ou swing trade). Vamos deixar para falar disso em outro artigo.
