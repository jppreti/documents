# 1. Funções de Agregação

Calculam valores com base em conjuntos de linhas: 
- COUNT(*): Conta o número de linhas.
- SUM(coluna): Soma os valores de uma coluna numérica.
- AVG(coluna): Calcula a média aritmética.
- MAX(coluna) / MIN(coluna): Encontra o maior ou menor valor.

# 2. Funções de String (Texto)

Manipulam e formatam textos:
- UPPER(coluna) / LOWER(coluna): Converte o texto para maiúsculas ou minúsculas.
- CONCAT(coluna1, coluna2) ou o operador ||: Junta textos.
- SUBSTRING(coluna FROM 1 FOR 3): Extrai uma parte do texto.
- LENGTH(coluna): Retorna o tamanho da string.

# 3. Funções de Data e Hora

Trabalham com registros temporais:
- NOW() ou CURRENT_TIMESTAMP: Retorna a data e hora atuais.
- AGE(data1, data2): Calcula a diferença entre duas datas.
- DATE_TRUNC('month', coluna): Trunca uma data para o início do mês, ano, etc.
- EXTRACT(YEAR FROM coluna): Extrai partes específicas de uma data (ano, mês, dia).

# 4. Funções Matemáticas

Executam cálculos numéricos:
- ROUND(coluna, 2): Arredonda um número para casas decimais específicas.
- ABS(coluna): Retorna o valor absoluto.
- CEIL(coluna) / FLOOR(coluna): Arredonda para cima ou para baixo.

# 5. Funções Condicionais e de Conversão

Ajudam a tratar nulos e criar regras lógicas:
- COALESCE(coluna, valor_alternativo): Retorna o primeiro valor não nulo da lista.
- NULLIF(val1, val2): Retorna nulo se os valores forem iguais.
- CAST(coluna AS tipo) ou coluna::tipo: Converte o tipo de dado de um campo.
