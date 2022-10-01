Como proposta de exercício temos um conjunto de palavras da [língua portuguesa](https://raw.githubusercontent.com/jppreti/EstruturaDadosC/master/datastructure/ListaDePalavrasPT.txt) que serão distribuídas em uma tabela hash.

O espalhamento deverá ser visualizado na forma de uma matriz de cores com variação na tonalidade para observar claramente os pontos de menor colisão e os de maior colisão.

Segue abaixo uma matriz exemplo:

![Espalhamento Ruim](https://github.com/jppreti/documents/blob/main/c/datastructure/images/GraficoEspalhamento1.png?raw=true)

Veja que claramente percebemos regiões de concentração das colisões (faixas mais claras e as faixas mais escuras).

Já neste outro exemplo abaixo, podemos perceber uma melhor distribuição (espalhamento) das chaves.

![Espalhamento Bom](https://github.com/jppreti/documents/blob/main/c/datastructure/images/GraficoEspalhamento2.png?raw=true)

Veja que é mais difícil encontrar pontos de convergência.

O objetivo do trabalho é apresentar pelo menos 2 funções de hash e 3 tamanhos de tabela de hash que sejam mais adequadas para a dispersão dos dados de acordo com as palavras da língua portuguesa como chave.

O gráfico pode ser montado no formato [PPM](https://en.wikipedia.org/wiki/Netpbm_format).
