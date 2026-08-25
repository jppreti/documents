# Comando `SELECT` no SQL

O comando **`SELECT`** é a espinha dorsal da DML (*Data Manipulation Language*) no SQL. Ele é utilizado para **consultar, recuperar e filtrar dados** armazenados em tabelas de bancos de dados relacionais.

Neste tutorial, você aprenderá desde as consultas mais simples até junções, agrupamentos e subconsultas avançadas.

---

## 🛠️ Tabelas de Exemplo (`clientes` e `pedidos`)

Para acompanhar os exemplos práticos, considere as seguintes estruturas de tabelas:

**Tabela: `clientes`**

| id_cliente | nome | cidade | idade | status |
| :---: | :--- | :--- | :---: | :---: |
| 1 | Ana Silva | São Paulo | 28 | Ativo |
| 2 | Carlos Souza | Rio de Janeiro | 35 | Inativo |
| 3 | Beatriz Lima | São Paulo | 22 | Ativo |
| 4 | Daniel Alves | Curitiba | 40 | Ativo |

**Tabela: `pedidos`**

| id_pedido | id_cliente | data_pedido | valor_total |
| :---: | :---: | :---: | :---: |
| 101 | 1 | 2026-01-10 | 250.00 |
| 102 | 1 | 2026-02-15 | 120.00 |
| 103 | 3 | 2026-03-01 | 450.00 |

---

## 1. Consulta Básica (Todas as Colunas vs Colunas Específicas)

### Consultando Todas as Colunas (`SELECT *`)

O caractere asterisco (`*`) retorna todas as colunas existentes na tabela.

```sql
SELECT * FROM clientes;
```

### Consultando Colunas Específicas (Recomendado em Produção)

Selecionar apenas o que você precisa economiza memória e largura de banda de rede.

```sql
SELECT nome, cidade 
FROM clientes;
```

---

## 2. Apelidos de Colunas e Tabelas (`AS`)

Você pode renomear colunas ou tabelas no resultado da consulta usando a palavra-chave `AS` para tornar a leitura mais amigável.

```sql
SELECT 
    nome AS nome_completo, 
    cidade AS cidade_residencia
FROM clientes;
```

---

## 3. Eliminando Duplicatas (`DISTINCT`)

Retorna apenas valores únicos, removendo linhas duplicadas do resultado.

```sql
SELECT DISTINCT cidade 
FROM clientes;
```

---

## 4. Filtrando Resultados com a Cláusula `WHERE`

A cláusula `WHERE` permite aplicar condições para recuperar apenas as linhas que atendam aos seus critérios.

```sql
SELECT nome, idade, cidade 
FROM clientes 
WHERE cidade = 'São Paulo' AND idade > 20;
```

### Principais Operadores de Filtro

| Operador | Descrição | Exemplo |
| :--- | :--- | :--- |
| `=` / `!=` | Igual / Diferente | `WHERE status = 'Ativo'` |
| `>`, `<`, `>=`, `<=` | Comparações numéricas | `WHERE idade >= 30` |
| **`BETWEEN`** | Faixa/Intervalo de valores | `WHERE idade BETWEEN 20 AND 30` |
| **`IN`** | Lista de valores aceitos | `WHERE cidade IN ('São Paulo', 'Curitiba')` |
| **`LIKE` / `ILIKE`** | Busca por padrão de texto | `WHERE nome LIKE 'A%'` (Nomes que começam com 'A') |
| **`IS NULL` / `IS NOT NULL`** | Verifica valores nulos | `WHERE status IS NOT NULL` |

---

## 5. Ordenando Resultados (`ORDER BY`)

Organiza o resultado em ordem crescente (`ASC` — padrão) ou decrescente (`DESC`).

```sql
-- Ordena por idade da maior para a menor
SELECT nome, idade, cidade 
FROM clientes 
ORDER BY idade DESC;

-- Ordenação múltipla: Primeiro por cidade (A-Z), depois por idade (maior para menor)
SELECT nome, cidade, idade 
FROM clientes 
ORDER BY cidade ASC, idade DESC;
```

---

## 6. Paginando Resultados (`LIMIT` e `OFFSET`)

Controla o número de linhas retornadas (ideal para paginação em sistemas web).

```sql
-- Retorna os 2 primeiros registros
SELECT * FROM clientes 
LIMIT 2;

-- Pulando os 2 primeiros registros e pegando os próximos 2 (Página 2)
SELECT * FROM clientes 
LIMIT 2 OFFSET 2;
```

---

## 7. Funções de Agregação e Agrupamento (`GROUP BY` e `HAVING`)

As funções de agregação realizam cálculos sobre um grupo de valores.

### Funções Comuns
* **`COUNT()`**: Conta o número de linhas.
* **`SUM()`**: Soma os valores de uma coluna.
* **`AVG()`**: Calcula a média aritmética.
* **`MIN()` / `MAX()`**: Encontra o menor/maior valor.

### Exemplo Prático com `GROUP BY`

Conta quantos clientes existem em cada cidade:

```sql
SELECT cidade, COUNT(*) AS total_clientes 
FROM clientes 
GROUP BY cidade;
```

### Filtrando Grupos com `HAVING`

> ⚠️ **Atenção:** O `WHERE` filtra linhas **antes** do agrupamento. O `HAVING` filtra grupos **após** a agregação ter sido feita!

```sql
-- Mostra apenas as cidades que possuem mais de 1 cliente cadastrado
SELECT cidade, COUNT(*) AS total_clientes 
FROM clientes 
GROUP BY cidade 
HAVING COUNT(*) > 1;
```

---

## 8. Junções de Tabelas (`JOINs`)

Servem para relacionar dados de duas ou mais tabelas.

### A. `INNER JOIN` (Apenas correspondências exatas em ambas as tabelas)

```sql
SELECT c.nome, p.id_pedido, p.valor_total 
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;
```

### B. `LEFT JOIN` (Todos da tabela da esquerda + correspondentes da direita)

```sql
-- Traz TODOS os clientes, mesmo aqueles que nunca fizeram nenhum pedido
SELECT c.nome, p.id_pedido, p.valor_total 
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;
```

### C. `RIGHT JOIN` (Todos da tabela da direita + correspondentes da esquerda)

```sql
SELECT c.nome, p.id_pedido, p.valor_total 
FROM clientes c
RIGHT JOIN pedidos p ON c.id_cliente = p.id_cliente;
```

---

## 9. Subconsultas (`Subqueries`)

Consultas `SELECT` aninhadas dentro de outra consulta.

### Exemplo Prático: Buscar clientes com idade superior à média de idade de todos os clientes

```sql
SELECT nome, idade 
FROM clientes 
WHERE idade > (SELECT AVG(idade) FROM clientes);
```

---

## ⚡ Ordem Lógica de Execução do `SELECT`

Embora você escreva a consulta em uma ordem, o mecanismo do SQL executa as cláusulas nesta sequência lógica interna:

1. **`FROM` / `JOIN`**: Seleciona e junta as tabelas base.
2. **`WHERE`**: Filtra as linhas brutas.
3. **`GROUP BY`**: Agrupa as linhas filtradas.
4. **`HAVING`**: Filtra os grupos agregados.
5. **`SELECT`**: Calcula as expressões e escolhe as colunas visíveis.
6. **`DISTINCT`**: Elimina linhas duplicadas.
7. **`ORDER BY`**: Ordena o resultado final.
8. **`LIMIT` / `OFFSET`**: Aplica o limite de paginação.

---

## 🎯 Boas Práticas ao Utilizar o `SELECT`

1. **Evite `SELECT *` em produção**: Liste explicitamente apenas as colunas que sua aplicação vai utilizar.
2. **Crie Índices**: Certifique-se de que colunas usadas em cláusulas `WHERE` e em relacionamentos de `JOIN` possuam índices criados.
3. **Mantenha os Aliases (`AS`) claros**: Facilita a leitura e manutenção de consultas longas.