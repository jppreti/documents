## Juros sobre Juros

Como vimos em nosso artigo sobre o [Juros Simples](), a correção incide apenas sobre o valor principal.

No juros simples, o principal não sofre correções ao longo do tempo.

Já nos **juros compostos** ocorre a aplicação de **juros sobre juros**, isto é, os juros são aplicados ao montante de cada período. O que é muito melhor para o investidor do que o juros simples.

Juros compostos são muito utilizados pelo sistema financeiro. A taxa de juros é sempre aplicada ao somatório do capital no final de cada mês.

Tomemos como exemplo um principal de **R$ 1.000,00** aplicados a um **juros simples** de **1% ao mês** pelo período de **10 meses**.

Ao final de **10 meses** teríamos um montante de **R$ 1.100,00**.

Já se pegarmos o mesmo exemplo mas aplicarmos juros compostos ao invés de juros simples, teríamos um montante de **R$ 1.104,62**.

Isso porque no juros simples o percentual sempre é calculado sobre R$ 1.000,00, independentemente se você está no 1º ou 10º mês da aplicação.

Já nos juros compostos teríamos uma atualização do principal a cada período (mês). O cálculo passo a passo seria como segue:

**1º mês:**  
principal: R$ 1.000,00  
juros: R$ 10,00 (1% sobre 1000)

**2º mês:**  
principal: R$ 1.010,00  
juros: R$ 10,10 (1% sobre 1010)

**3º mês:**  
principal: R$ 1.020,10  
juros: R$ 10,201 (1% sobre 1020,10)

… e assim prosseguiria …

A fórmula do juros composto é:

`montante = principal * (1 + juros/100)período`

Muito legal não é mesmo, essa é a magia do investimento a longo prazo, usar os juros compostos a seu favor, mas precisamos de tempo.

**Por isso, comece a poupar o quanto antes, por menor que seja o valor.**

Crie um arquivo HTML com o código abaixo e faça diversas simulações para ver como os juros compostos podem ser muito poderosos.

```html
<script type="text/javascript">
    function calcJurosComposto() {
        var principal = document.getElementById("txtPrincipal").value;
        var meses = document.getElementById("txtMeses").value;
        var juros = document.getElementById("txtJuros").value;
        var pRes = document.getElementById("pResultado");
        var pRes2 = document.getElementById("pResultado2");
        var res = parseFloat(principal) + parseFloat(principal) * parseFloat(juros)/100*meses;
        pRes.innerHTML = "Juros Simples: R$ " + res.toFixed(2);
        res = parseFloat(principal) * Math.pow((1+parseFloat(juros)/100),meses);
        pRes2.innerHTML = "Juros Compostos: R$ " + res.toFixed(2);
    }
</script>
<p>Principal: </p><input type="number" id="txtPrincipal"><br>
<p>Qtde. de meses: </p><input type="number" id="txtMeses"><br>
<p>Juros: </p><input type="number" id="txtJuros"><br>
<button id="btnCalcularComposto" onclick="calcJurosComposto();">Calcular</button><br>
<p id="pResultado"></p>
<p id="pResultado2"></p>
```

### Valor Futuro

Como já falamos antes em nosso artigo sobre [Juros Simples](), o *Future Value*, indicado nas calculadoras financeiras pela tecla `FV`, representa a soma do capital com o juros.

E se eu já sei o valor futuro e quero descobrir o principal?

#### Por que isso é importante?

Tomemos como exemplo o [Fundo Garantidor de Créditos](https://www.fgc.org.br/) (FGC).

Trata-se de uma entidade privada, sem fins lucrativos, que administra um mecanismo de proteção aos correntistas, poupadores e investidores, que permite recuperar os depósitos ou créditos mantidos em instituição financeira, até determinado valor, em caso de intervenção, de liquidação ou de falência.

Existem CDBs que são protegidos pelo FGC até o limite de R$ 250.000,00.

Então se o FGC garante no máximo R$ 250.000,00, **qual o valor máximo devo aplicar** em um CDB de **5 anos** que paga **1% ao mês**?

O principal não deve ultrapassar **R$ 137.612,40** para que o montante acumulado ao final de 5 anos não ultrapasse os R$ 250.000,00 garantidos pelo FGC.

Para chegarmos a essa resposta utilizamos a fórmula:

`principal = montante * (1 + juros/100)-período`

Ou seja:

`250.000 * (1 + 1/100)-60`

Abaixo deixamos uma calculadora para que você possa realizar as suas simulações:

```html
<script type="text/javascript">
    function calcPrincipal() {
        var montante = document.getElementById("txtMontante").value;
        var meses = document.getElementById("txtMeses2").value;
        var juros = document.getElementById("txtJuros3").value;
        var pRes = document.getElementById("pResultado3");
        var res = parseFloat(montante) * Math.pow((1+parseFloat(juros)/100),(meses*-1));
        pRes.innerHTML = "R$ " + res.toFixed(2);
    }
</script>
<p>Montante: (R$)</p><input type="number" id="txtMontante"><br>
<p>Qtde. de meses: </p><input type="number" id="txtMeses2"><br>
<p>Juros: (%)</p><input type="number" id="txtJuros3"><br>
<button id="btnCalcularPrincipal" onclick="calcPrincipal();">Calcular</button><br>
<p id="pResultado3"></p>
```

### Aportes Regulares

Até agora nossos cálculos levaram apenas em consideração um único aporte, que é o valor principal, mas como ficaria o valor futuro caso eu realizasse aportes regulares?

Imagine que você queira saber quanto vai ter daqui a **20 anos** fazendo depósitos (aportes) mensais de **R$ 1.000,00** com juros de **1% ao mês**.

Esse cenário é o que muitos se deparam quando tentam projetar uma reserva financeira para a [aposentadoria]().

Nesse caso a fórmula do juros compostos com aportes é:

`montante = aporte * ((1 + juros/100)período - 1) / (juros/100)`

Aplicando ao nosso exemplo:

`1000 * ((1 + 1/100)240 - 1) / (1/100)`

Portanto, teríamos **R$ 989.255,37** ao final de **20 anos**.

Como pode ver, a combinação dos juros compostos mais os aportes periódicos pode trazer resultados muito positivos no longo prazo.

Crie um arquivo HTML com o código abaixo e utilize a calculadora abaixo para suas simulações:

```html
<script type="text/javascript">
    function calcAportesPeriodicos() {
        var aporte = document.getElementById("txtAporte4").value;
        var meses = document.getElementById("txtMeses4").value;
        var juros = document.getElementById("txtJuros4").value;
        var pRes = document.getElementById("pResultado4");
        var res = parseFloat(aporte) * (Math.pow((1+parseFloat(juros)/100),meses)-1) / (parseFloat(juros)/100);
        pRes.innerHTML = "R$ " + res.toFixed(2);
    }
</script>
<p>Aporte Mensal: (R$)</p><input type="number" id="txtAporte4"><br>
<p>Qtde. de meses: </p><input type="number" id="txtMeses4"><br>
<p>Juros: (%)</p><input type="number" id="txtJuros4"><br>
<button id="btnCalcularAportesPeriodicos" onclick="calcAportesPeriodicos();">Calcular</button><br>
<p id="pResultado4"></p>
```

Convido você a aprender como calcular esses exemplos utilizando a calculadora financeira mais conhecida mundialmente, a [HP 12C]().
