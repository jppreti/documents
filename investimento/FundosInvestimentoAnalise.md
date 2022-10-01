# Analisando Fundos de Investimento

## Introdução

Como já vimos no artigo [Entendendo os Dados dos Fundos de Investimento](), existe uma série de dados que devemos conhecer quando vamos aplicar em um fundo de investimento.

Mas como podemos comparar esses fundos? Este é o objetivo deste artigo.

Antes de mais nada é **importante** dizer que ao analisar um fundo de investimento devemos verificar a **cesta de ativos** em que esse fundo investe. Devemos verificar também quem é o **gestor** e a qualidade da equipe, bem como entender a **estratégia** utilizada pelo gestor.

Mas é comum utilizarmos **indicadores técnicos** para realizar um filtro e fazermos uma comparação prévia entre os fundos de investimento.

Neste artigo vou apresentar uma ferramenta que nos permite comparar fundos com alguns indicadores técnicos.

## Ferramenta

Gosto de utilizar a ferramenta da [Vérios](https://verios.com.br/apps/comparacao/log/1ano/cdi/), uma empresa que auxilia no investimento por meio do gerenciamento de forma automática da sua carteira de investimentos.

A [ferramenta](https://verios.com.br/apps/comparacao/log/1ano/cdi/) fornecida por eles de forma gratuita permite comparar fundos de investimento. Vamos entender como utilizá-la.

![](https://github.com/jppreti/documents/blob/main/investimento/images/Verios.png?fit=750%2C649)

Por **padrão** ela já mostra no gráfico a curva do rendimento do **[CDI]()** (**linha preta**) para o último ano (**6,34%**). Mas perceba que você pode optar por comparar com o **[Ibovespa]()** (**42,38%**). Veja as mudanças nas áreas demarcadas em vermelho.

![](https://github.com/jppreti/documents/blob/main/investimento/images/VeriosIBOV.png?fit=750%2C653)

É muito comum utilizarmos o gráfico do **CDI** para comparar fundos de **renda fixa** e o **Ibovespa** para comparar **fundos de ações**.

Perceba também que na **parte superior** podemos **pesquisar** **fundos** pelo **nome** ou pelo **CNPJ**. Quando for pesquisar um fundo é sempre bom buscar pelo CNPJ para ter certeza que está vendo o gráfico do fundo de interesse e não outro. Isso porque existem variações de fundos para um mesmo grupo de investimento.

### Gráfico de Rendimento

Para fins didáticos vou escolher 3 fundos de renda fixa sem qualquer indicação de investimento:

- CA Indosuez DI Master Fundo de Investimento Renda Fixa Referenciado DI Longo Prazo;
- AF Invest Fundo de Investimento Renda Fixa Crédito Privado Geraes;
- Capitânia Top Crédito Privado Fundo de Investimento em Cotas de Fundos de Investimento Renda Fixa.

Adicione cada um desses três fundos na ferramenta para que você possa visualizar a curva de rendimento.

Na data de publicação deste artigo, esse foi o resultado obtido para o rendimento desses fundos nos últimos **3 anos**:

![](https://github.com/jppreti/documents/blob/main/investimento/images/VeriosCDI.png?fit=750%2C489)

![](https://github.com/jppreti/documents/blob/main/investimento/images/VeriosCDILista.png?fit=750%2C247)

Perceba que para cada fundo é apresentada a:

#### Rentabilidade Absoluta

Representa o total rentabilizado no período escolhido ***já livre das taxas de administração***.

Nesse caso o fundo que mais rentabilizou em **3 anos** foi o **AF Invest** com **33,57%** de **rentabilidade absoluta**.

#### Rentabilidade Relativa

Indica o quanto o fundo rentabilizou comparado a algum indicador (CDI ou Ibovespa).

Voltando ao fundo **AF Invest** que rentabilizou em **3 anos** o equivalente a **114,31%do CDI** (**rentabilidade relativa**).

#### Consistência

Calcula quantas vezes o fundo superou o *benchmark* (CDI ou Ibovespa) em períodos de 1 ano;

Perceba que a **consistência** do AF Invest foi de **100%**, ou seja, nesses 3 anos **sempre superou** o *benchmark*, no caso o CDI.

#### Sharpe

Expressa a relação retorno/risco e informa se o fundo oferece rentabilidade compatível com o risco a que expõe o investidor.

Quanto ao indicador **sharpe**, o **do AF Invest é disparado o maior**, isso porque **o retorno foi o maior** mesmo com o **risco** praticamente **mais baixo**. Mas atenção, esse indicador não é muito indicado para fundos de crédito, cujo risco não está atrelado às oscilações (volatilidade) e sim ao crédito.

#### Risco

É a probabilidade de se obter retornos negativos ou abaixo do esperado.

Podemos ver que o que apresenta o **maior** **risco** dos três é o capitânia por conta da **volatilidade** apresentada. Mesmo assim o valor de 0,76% é baixo.

Lembrando que há vários tipos de risco que não são medidos pela volatilidade, como o risco de crédito e risco de liquidez, por exemplo.

Perceba que na **parte superior da ferramenta** estamos na aba **Rentabilidade**, mas existem mais 3 outros tipos de gráficos: *Underwater*, *Volatilidade* e *Correlação*. Vamos analisar cada um deles.

### Gráfico Underwater

Esse é um gráfico interessante para **visualizar as perdas**. Ele desconsidera todos os ganhos do investimento e mostra apenas as perdas.

Dessa forma podemos observar visualmente as maiores perdas que o investimento apresentou no passado e quanto tempo demorou para os investidores se recuperarem desse prejuízo. Vejamos esse gráfico para os mesmos 3 fundos no período de 3 anos.

![](https://github.com/jppreti/documents/blob/main/investimento/images/VeriosUnderwater.png?fit=750%2C483)

Como a cor é **verde** sabe-se que foi o **fundo Capitânia** que apresentou a maior **perda** (de quase **0,8%**) e que o tempo para se recuperar dessa perda foi de **42 dias**, o pico foi no dia 15/12/2017 e chegou a zero novamente em 26/01/2018. Basta movimentar o mouse sobre o gráfico para visualizar essas informações.

### Gráfico de Oscilação

O gráfico de oscilação mostra o **quão forte é a variação do preço** (seja positiva ou negativa). Quanto maior a oscilação maior o risco, maiores as chances de grandes ganhos, mas também de grandes perdas.

![](https://github.com/jppreti/documents/blob/main/investimento/images/VeriosVolatilidade.png?fit=750%2C483)

Perceba que o CA Indosuez (**azul**) apresentou a **menor oscilação**, mas também o menor rendimento no período. A vantagem aqui é que não houve sustos no rendimento.

Já o Capitânia (**verde**) foi o que apresentou a **maior oscilação** no período, mas não foi de forma positiva como podemos confirmar pelo gráfico *Underwater*.

É **importante** entender que a oscilação em valores altos não quer dizer que seja ruim, apenas que os preços sofreram grandes variações (para mais ou para menos).

### Matriz de Correlação

A **correlação** mede o quanto os ativos da carteira que os fundos de investimento possuem são os mesmos.

#### Por que isso é importante?

Por que você pode estar aplicando em fundos diferentes, mas sem de fato diversificar, ou seja, estar aplicando nos mesmos produtos.

A correlação é muito importante para que você realmente saiba se está de fato diversificando.

Observemos a matriz de correlação dos nossos 3 fundos de exemplo.

![](https://github.com/jppreti/documents/blob/main/investimento/images/VeriosCorrelacao.png?fit=750%2C337)

O valor **1,00** quer dizer que os fundos estão **100% correlacionados**, ou seja, os produtos desses dois fundos seriam praticamente iguais, sem diversificação alguma.

Por isso que na diagonal todos os valores são 1,00, porque está comparando o fundo com ele mesmo.

Agora vamos analisar o valor **0,16**. Este indica que o fundo **Capitânia** e o fundo **AF Invest** tem apenas **16% de correlação**, ou seja, olhando os ativos desses dois fundos, apenas **16% deles são equivalentes**.

Esse valor 0,16 é considerado baixo, portanto esses 2 fundos tem **baixa correlação**, o que é interessante para quem está querendo **diversificar**.

Já se pegarmos o valor **0,83**, veremos que o fundo **AF Invest** tem **83% de correlação** com o fundo **CA Indosuez**, uma correlação alta.

Não custa lembrar que rendimento passado não é garantia de rendimento futuro. Então sempre procure realizar uma análise técnica juntamente com um estudo qualitativo do fundo e procure diversificar de forma a minimizar os riscos.
