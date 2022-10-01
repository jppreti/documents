# Entendendo o Gráfico de Candlestick

## Ferramenta

Você pode visualizar os gráficos por meio da ferramenta localizada em [Gráfico de Ações em Tempo Real - Investing.com](https://br.investing.com/charts/stocks-charts). Outra ferramenta bastante interessante é a [https://br.tradingview.com/](https://br.tradingview.com/).

![](https://github.com/jppreti/documents/blob/main/investimento/images/Ferramenta-Grafica.png?fit=750%2C501)

Ferramenta para visualização gráfica das negociações na bolsa

## Gráfico de Linha vs Gráfico de Candlestick

Normalmente, enquanto na renda fixa, estamos acostumados a visualizar gráficos de linha ou de barras para verificar a evolução (do preço, de um indicador econômico, do rendimento,…) ao longo do tempo.

O exemplo abaixo apresenta um gráfico de linha/área da evolução dos valores das cotas do fundo imobiliário XPML11:

![](https://github.com/jppreti/documents/blob/main/investimento/images/XPML11.png?fit=750%2C298)

Gráfico de Linha do FII XPML11

Esse tipo de gráfico tem a vantagem de ser **simples** porque mostra apenas o preço de fechamento para cada intervalo de tempo analisado (neste gráfico é diário) ao longo do período, mas tem a desvantagem de não apresentar nenhuma informação sobre como foi a variação do preço nesse intervalo.

> Usamos o termo **intervalo de tempo** porque cada ponto no gráfico pode representar 1 min, 15 min, 30 min, 1 hora, 1 dia, 1 mês, … de acordo com a configuração do gráfico. Nos gráficos deste artigo, cada ponto representa 1 dia, ou seja, todas as negociações no dia do pregão na bolsa. *Perceba que nos gráficos, ao lado do código do ativo (XPML11), existem os valores: 1m, 30m, 1h, D. O valor D (diário) está selecionado na cor azul.*
> 
> **Atenção**

Já o gráfico de **candlestick** apresenta **4 preços** para cada intervalo de tempo (também diário neste exemplo) de negociação. Veja abaixo o mesmo gráfico anterior de XPML11 só que como candlestick.

![](https://github.com/jppreti/documents/blob/main/investimento/images/XPML11Candle.png?fit=750%2C297)

Gráfico de Candlestick do FII XPML11

O candlestick apresenta **duas vantagens**:

- Visualização mais fácil das **tendências**, graças ao seu padrão de cores que identificam fechamentos positivos e negativos;
- Formam **padrões** que podem significar indefinição, possível reversão ou continuação de movimentos.

O termo em língua inglesa **candlestick** (**candelabro**) se deve ao fato dos elementos gráficos utilizados na representação dos preços praticados pelo mercado lembrarem o formato de velas, distribuídas sobre a área do gráfico.

## Estrutura do Candlestick

Candlestick é o nome dado para cada retângulo (vermelho/verde ou preto/branco) com linhas presente no gráfico.

Ao retângulo damos o nome de **corpo do candlestick** e as linhas chamamos de **sombra**. Um candlestick pode não ter sombra, mas sempre terá um corpo. Vamos entender como ler o candlestick.

A primeira coisa que podemos observar é a diferença nas cores.

![](https://github.com/jppreti/documents/blob/main/investimento/images/Candlestick.png?fit=750%2C346)

Estrutura do Candlestick

O candle **verde** (pode ser branco também) indica um candle de **alta**, ou seja, o preço fechou **positivo** no intervalo analisado (mais alto em relação ao preço de abertura). Já o candle **vermelho** (pode ser preto também) indica um candle de **baixa**, ou seja, o preço fechou **negativo** no intervalo analisado (mais baixo em relação ao preço de abertura).

Perceba que no gráfico de candlestick **verde**, o preço de abertura foi de R$ 10,72 e fechou a R$ 11,00, ou seja, uma **alta de 2,6%**. Já no gráfico de candlestick **vermelho**, o preço de abertura foi de R$ 11,00 e fechou a R$ 10,72, ou seja, uma **queda de 2,5%**.

Perceba também que existem duas linhas retas e finas nos extremos do candlestick. Essas linhas são chamadas de **sombras** (sombra **superior** e sombra **inferior**).

Essas linhas nos mostram a **variação do preço** no intervalo analisado. A sombra superior mostra o **maior preço** negociado no intervalo, enquanto a sombra inferior mostra o **menor preço**.

Perceba no gráfico que, independentemente de ser o candle **verde** ou **vermelho**, o maior preço alcançado foi de **R$ 11,23** e o menor **R$ 10,42**. Isso quer dizer que a variação dos preços negociados foi maior do que 7%.

No começo pode parecer estranho, mas procure sempre que possível visualizar utilizando o gráfico de candlestick para ir se acostumando.
