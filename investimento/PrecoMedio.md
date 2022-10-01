## Introdução

Para saber como realizar as operações de compra e venda veja o artigo [Conhecendo as Operações do Home Broker]().

Quando você compra ações e fundos imobiliários é importante que você saiba exatamente quanto essas aquisições te custaram. Dessa forma você saberá exatamente qual o seu **rendimento**. Também é o preço médio (PM) que é utilizado para o informe de rendimento na receita federal.

## O que é?

O preço médio (PM) é a média dos preços pagos na aquisição de um determinado ativo (FII, Ação,…) ao longo do tempo.

## Como fazer o cálculo?

Para realizarmos o cálculo corretamente faz-se necessário saber: qual ativo foi adquirido, a quantidade, o preço e as taxas pagas.

A título de exemplo, vamos supor que você tenha realizado as seguintes operações de compra/venda:

| **Data** | **Papel** | **Qtde** | **Preço** | **Taxas** | **Valor Total** | **PM**   |
| -------- | --------- | -------- | --------- | --------- | --------------- | -------- |
| 03/06    | ITSA4     | 100      | R$ 12,15  | R$ 1,21   | -R$ 1.216,21    | R$ 12,16 |
| 18/06    | ITSA4     | 200      | R$ 12,20  | R$ 2,44   | -R$ 2.442,44    | R$ 12,20 |
| 05/07    | ITSA4     | 100      | R$ 13,27  | R$ 1,33   | -R$ 1.328,33    | R$ 12,47 |
| 05/08    | ITSA4     | -200     | R$ 12,26  | R$ 2,52   | +R$ 2.449,48    | R$ 12,47 |
| 20/08    | ITSA4     | 200      | R$ 12,10  | R$ 2,40   | -R$ 2.422,40    | R$ 12,29 |

Esses dados você encontra na nota fiscal emitida pela própria corretora.

Perceba que além do **preço unitário**, precisamos utilizar no cálculo as **taxas** pagas (corretagem, imposto). As taxas pagas fazem parte do custo de aquisição e devem constar no seu preço médio.

Para o cálculo do **Valor Total** utilizamos a fórmula:

`Valor Total = (Preço * Qtde) + Taxas`

O **Valor Total** teve seu valor com **sinal invertido** para representar um Débito (vermelho) quando na compra e um crédito (azul) quando na venda. Apenas para representar o quanto será debitado ou creditado na sua **conta corrente**.

Para calcularmos o preço médio basta somarmos todos os custos de aquisição e dividirmos pela quantidade total de um determinado ativo.

### Exemplo

Na data de **03/06/2019** o **preço médio** de **ITSA4** ficou em **R$ 12,16**. Isso porque pegamos o `Valor Total / Qtde` (1216,21/100). Perceba que apesar do preço da ação ser de R$ 12,15, o PM ficou em R$ 12,16 por conta das taxas.

Mas em **18/06/2019** adquirimos mais **200** ações de **ITSA4** ao preço de **R$ 12,20**. Só que agora para calcularmos o PM precisamos levar em consideração as ações de ITSA4 que já temos na carteira.

Portanto, o cálculo deve ocorrer conforme segue:

`PM = (1216,21 + 2442,44) / (100 + 200)`

Temos então na data de **18/06/2019** um **PM** de **R$ 12,20** para um total de **300 ações**.

Para calcular o **PM** de **ITSA4** na data de **05/07/2019** temos:

`PM = (1216,21 + 2442,44 + 1328,33) / (100 + 200 + 100)`

Que resulta em um **PM** de **R$ 12,47** para **400 ações**.

### Como fica o Preço Médio na Venda

O preço médio **não se altera** quando você vende o ativo. Quando você vende você deve se preocupar em utilizar o preço médio para verificar se houve lucro ou prejuízo na operação.

Perceba que em **05/08/2019** realizamos uma venda de **200** ações de **ITSA4** ao preço de **R$ 12,26**. O **Valor Total** ficou em **R$ 2449,48** (`200*12,26-2,52`). Perceba que na venda devemos **descontar as taxas**, visto que estas reduzem o nosso lucro.

O **PM** continua em **R$ 12,47**, mas agora para **200 ações**. Perceba que tivemos um **prejuízo** nessa operação de **R$ 44,52**.

`Rendimento = 2449,48 - (200 * 12,47)`

### Atenção

No entanto, apesar do **PM** continuar sendo de **R$ 12,47**, **você não tem mais 400, mas sim 200 ações**.

Isso vai influenciar no cálculo do PM da próxima aquisição de ITSA4. Veja como ocorreu o cálculo do **PM** para a aquisição de **200** ações de **ITSA** em **20/08**:

`PM = (200 * 12,47 + 2422,40) / (200 + 200)`

O novo **PM** ficou em **R$ 12,29** para **400 ações**. Essa influência no resultado do novo PM se dá por que o valor de R$ 12,47 não tem mais tanto peso (antes eram 400 ações com esse preço, agora são apenas 200 ações).

Agora você sabe como usar o preço médio para calcular seu lucro real, o que é útil não apenas para saber qual é a sua **performance** na bolsa de valores, mas também para calcular seu **imposto de renda**.

Quanto ao **imposto de renda**, você está **isento** se vendeu até **R$ 20.000** no **mês**. Você deve somar todas as suas **operações normais**, todas as ordens de venda executadas entre o primeiro e o último dia do mês em questão.

**Importante**: Operações de Mercado Futuro, Opções e Day Trade **não possuem isenção** e não devem entrar neste cálculo. Essas operações trataremos em outros artigos.

## Planilha

Deixamos aqui uma planilha para que você possa experimentar e verificar o cálculo do preço médio dos seus ativos. A planilha já vem preenchida com o exemplo utilizado neste artigo.

Para ter acesso [clique aqui](https://docs.google.com/spreadsheets/d/1RQIJe4Atj6coklI_F5_iMZA2GMDq8pVq1hHQ6t39XDo/edit?usp=sharing).