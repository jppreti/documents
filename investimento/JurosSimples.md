## Acréscimo Simples

O juros simples é um acréscimo calculado sobre um valor inicial que vamos chamar aqui de **principal**.

Sua fórmula é expressa por:

`acréscimo = principal * taxa / 100`

Por exemplo, o acréscimo de um valor de **R$ 1.000,00** aplicando um juros simples de **10%** é igual a **R$ 100,00** `(1000*10/100)`.

A calculadora abaixo vai te ajudar nas simulações. Nesse caso a calculadora já está somando o acréscimo ao principal (valor futuro).

<script type="text/javascript">
    function calcJurosSimples() {
        var principal = document.getElementById("txtPrincipal").value;
        var juros = document.getElementById("txtJuros").value;
        var pRes = document.getElementById("pResultado");
        var res = parseFloat(principal) * (1+parseFloat(juros)/100);
        pRes.innerHTML = "R$ " + res.toFixed(2);
    }
</script>
<p>Principal: (R$)</p><input type="number" id="txtPrincipal"><br>
<p>Juros: (%)</p><input type="number" id="txtJuros"><br>
<button id="btnCalcularSimples" onclick="calcJurosSimples();">Calcular</button><br>
<p id="pResultado"></p>

## Calculando o Rendimento

Talvez o uso mais comum que você utilizará para o cálculo do juros simples será para calcular o quanto rendeu a venda ou o recebimento de um determinado ativo financeiro.

Por exemplo, vamos imaginar que você aplicou R$ 1.000,00 e depois de 6 meses recebeu de volta R$ 1.072,00. De **quanto foi o rendimento?**

Nesse caso a fórmula a ser aplicada é:

`juros = (valor recebido / valor inicial - 1) * 100`

Portanto o juros (**rendimento**) foi de **7,2%** em **6 meses**:

`(1072 / 1000 - 1) * 100`

A calculadora abaixo vai te ajudar nas simulações para descobrir o rendimento.

<script type="text/javascript">
    function calcRendimento() {
        var inicial = document.getElementById("txtValorInicial").value;
        var recebido = document.getElementById("txtValorRecebido").value;
        var pRes = document.getElementById("pResultado2");
        var res = (parseFloat(recebido) / parseFloat(inicial) - 1) * 100;
        pRes.innerHTML = res.toFixed(2) + " %";
    }
</script>
<p>Valor Inicial: (R$)</p><input type="number" id="txtValorInicial"><br>
<p>Valor Recebido: (R$)</p><input type="number" id="txtValorRecebido"><br>
<button id="btnCalcularRendimento" onclick="calcRendimento();">Calcular</button><br>
<p id="pResultado2"></p>

## Calculando com Períodos

O juros simples também pode considerar períodos regulares. Por exemplo, um capital de R$ 1.000,00 durante 3 anos à taxa de 9% ao ano são dados por:

`acréscimo = principal * taxa / 100 * período`

Nesse caso o **acréscimo** foi de **R$ 270,00** em **3 anos***:

`1000 * 9 / 100 * 3`

**Trataremos os juros compostos em outro artigo.**

Use o simulador abaixo para calcular com períodos:

<script type="text/javascript">
    function calcJurosPeriodo() {
        var principal = document.getElementById("txtPrincipal3").value;
        var juros = document.getElementById("txtJuros3").value;
        var periodo = document.getElementById("txtPeriodo3").value;
        var pRes = document.getElementById("pResultado3");
        var res = parseFloat(principal) * (parseFloat(juros)/100) * parseFloat(periodo);
        pRes.innerHTML = "R$ " + res.toFixed(2);
    }
</script>
<p>Principal: (R$)</p><input type="number" id="txtPrincipal3"><br>
<p>Juros: (%)</p><input type="number" id="txtJuros3"><br>
<p>Período: </p><input type="number" id="txtPeriodo3"><br>
<button id="btnCalcularPeriodo" onclick="calcJurosPeriodo();">Calcular</button><br>
<p id="pResultado3"></p>

### Taxa vs Período

A taxa tem que ser de acordo com o período. O que isso quer dizer?

Em nosso exemplo, 9% é uma **taxa ao ano**, então o **período** na fórmula tem que ser em anos, no nosso exemplo foram **3 anos**.

Mas e se o período ou a taxa não forem correspondentes, por exemplo, taxa ao mês e período em anos?

Nesse caso você precisa converter a taxa em ano ou converter o período para meses.

Vejamos o mesmo exemplo anterior. Um capital de **R$ 1.000,00** durante **3 anos** (%a.a.) à taxa de **0,75% ao mês** (%a.m.).

Basta converter 3 anos em 36 meses (3×12) e usar a mesma fórmula.

Nesse caso o **acréscimo** foi de **R$ 270,00** em **36 meses**:

`1000 * 0,75 / 100 * 36`

## Valor Futuro

Ou *Future Value*, indicado nas calculadoras financeiras pela tecla `FV`, representa a soma do capital com o juros.

A nossa primeira calculadora neste artigo calcula justamente o valor futuro, que é o principal mais o acréscimo do juros.

Mas e se você sabe o valor futuro e quer descobrir, por exemplo, o período?

Por exemplo, gostaria de descobrir **quantos meses** eu levaria para ter R$ 2.500,00 aplicando R$ 1.000,00 a um juros simples de **1% ao mês**.

Perceba que neste caso eu sei o principal (**R$ 1.000,00**), sei o juros (**1% a.m.**) e já sei o valor futuro (**R$ 2.500,00**), mas não sei o tempo que isso vai levar.

`tempo = (valor futuro - principal) / (taxa / 100 * principal)`

Nesse caso levariam **150 meses** para conseguir **R$ 2.500,00** com uma aplicação inicial de **R$ 1.000,00** a um juros simples de **1% a.m.**:

`(2500 - 1000) / (1 / 100 * 1000)`

Faça suas simulações utilizando a calculadora abaixo:

<script type="text/javascript">
    function calcPeriodo() {
        var principal = document.getElementById("txtPrincipal4").value;
        var juros = document.getElementById("txtJuros4").value;
        var valorFuturo = document.getElementById("txtValorFuturo4").value;
        var pRes = document.getElementById("pResultado4");
        var res = (parseFloat(valorFuturo) - parseFloat(principal)) / (parseFloat(juros) / 100 * parseFloat(principal));
        pRes.innerHTML = res.toFixed(2);
    }
</script>
<p>Principal: (R$)</p><input type="number" id="txtPrincipal4"><br>
<p>Juros: (%)</p><input type="number" id="txtJuros4"><br>
<p>Valor Futuro: (R$)</p><input type="number" id="txtValorFuturo4"><br>
<button id="btnCalcularPeriodo2" onclick="calcPeriodo();">Calcular</button><br>
<p id="pResultado4"></p>

Agora podemos dar um passo mais avançado e conhecer os [Juros Compostos](), muito utilizado por investidores.
