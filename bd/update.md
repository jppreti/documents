# Comando `UPDATE` do SQL

O comando **`UPDATE`** faz parte da DML (*Data Manipulation Language*) do SQL e é utilizado para **modificar/atualizar dados já existentes** nas tabelas de um banco de dados relacional.

Neste guia, você aprenderá desde a sintaxe básica até técnicas avançadas e essenciais de segurança para evitar alterações acidentais.

---

## 🛠️ Tabela de Exemplo (`funcionarios`)

Para os exemplos práticos deste tutorial, considere uma tabela chamada `funcionarios` com a seguinte estrutura:

| id_func | nome | cargo | departamento | salario | ativo |
| :---: | :--- | :--- | :--- | :---: | :---: |
| 1 | Ana Silva | Analista Jr | TI | 4500.00 | TRUE |
| 2 | Carlos Souza | Desenvolvedor | TI | 6000.00 | TRUE |
| 3 | Beatriz Lima | Gerente | RH | 8500.00 | TRUE |
| 4 | Daniel Alves | Estagiário | Marketing | 2000.00 | FALSE |

---

## ⚠️ A Regra de Ouro do `UPDATE`

> **SEMPRE UTILIZE A CLÁUSULA `WHERE`!**
> 
> Se você executar `UPDATE funcionarios SET salario = 5000.00;` sem a cláusula `WHERE`, **TODOS os funcionários da tabela passarão a ter o salário de R$ 5.000,00!**

---

## 1. Atualização Básica de uma Única Coluna

Altera o valor de uma coluna para um ou mais registros específicos filtrados pelo `WHERE`.

### Sintaxe

```sql
UPDATE nome_da_tabela
SET nome_da_coluna = novo_valor
WHERE condicao;
```

### Exemplo Prático

Promover a funcionária `Ana Silva` (ID = 1) para "Analista Pleno":

```sql
UPDATE funcionarios
SET cargo = 'Analista Pleno'
WHERE id_func = 1;
```

---

## 2. Atualizando Múltiplas Colunas ao Mesmo Tempo

Para modificar mais de uma coluna em uma única instrução, separe as atribuições `coluna = valor` por **vírgulas**.

### Sintaxe

```sql
UPDATE nome_da_tabela
SET coluna1 = valor1,
    coluna2 = valor2,
    coluna3 = valor3
WHERE condicao;
```

### Exemplo Prático

Aumentar o salário e alterar o cargo da funcionária `Ana Silva` simultaneamente:

```sql
UPDATE funcionarios
SET cargo = 'Analista Senior',
    salario = 7200.00
WHERE id_func = 1;
```

---

## 3. Atualizações com Operações Matemáticas e Expressões

Você pode usar o próprio valor atual da coluna para calcular o novo valor (ex: aumentos percentuais ou reajustes).

### Exemplo Prático: Conceder um aumento de 10% a todos os funcionários do departamento de TI

```sql
UPDATE funcionarios
SET salario = salario * 1.10
WHERE departamento = 'TI' AND ativo = TRUE;
```

### Exemplo Prático: Desconto fixo no salário

```sql
UPDATE funcionarios
SET salario = salario - 200.00
WHERE id_func = 4;
```

---

## 4. Atualização Condicional com `CASE`

Permite aplicar diferentes regras de atualização em um único comando `UPDATE`, funcionando como uma estrutura `IF / ELSE`.

### Sintaxe

```sql
UPDATE nome_da_tabela
SET coluna = CASE
    WHEN condicao1 THEN valor1
    WHEN condicao2 THEN valor2
    ELSE valor_padrao
END
WHERE condicao_geral;
```

### Exemplo Prático: Reajuste salarial por departamento em uma única query

```sql
UPDATE funcionarios
SET salario = CASE
    WHEN departamento = 'TI' THEN salario * 1.12        -- 12% para TI
    WHEN departamento = 'RH' THEN salario * 1.08        -- 8% para RH
    WHEN departamento = 'Marketing' THEN salario * 1.05 -- 5% para Marketing
    ELSE salario
END
WHERE ativo = TRUE;
```

---

## 5. Atualização Baseada em Outra Tabela (`UPDATE ... FROM` / `JOIN`)

Muitas vezes é necessário atualizar os dados de uma tabela com base nos dados presentes em outra tabela.

### Sintaxe no PostgreSQL / SQLite (`UPDATE ... FROM`)

```sql
UPDATE funcionarios f
SET salario = f.salario + n.bonus
FROM novos_bonus n
WHERE f.id_func = n.id_func;
```

### Sintaxe no MySQL (`UPDATE ... JOIN`)

```sql
UPDATE funcionarios f
INNER JOIN novos_bonus n ON f.id_func = n.id_func
SET f.salario = f.salario + n.bonus;
```

---

## 6. Atualização com Subconsultas (`Subqueries`)

Você pode definir o novo valor de uma coluna (ou o filtro do `WHERE`) utilizando uma instrução `SELECT`.

### Exemplo Prático: Ajustar o salário do estagiário para ser metade da média salarial da empresa

```sql
UPDATE funcionarios
SET salario = (SELECT AVG(salario) / 2 FROM funcionarios WHERE cargo != 'Estagiário')
WHERE cargo = 'Estagiário';
```

---

## 7. Retornando os Dados Atualizados (`RETURNING`)

Disponível em bancos como **PostgreSQL**, **Oracle** e **SQLite**, a cláusula `RETURNING` permite visualizar imediatamente como ficaram as linhas alteradas sem precisar fazer um `SELECT` separado depois.

### Exemplo Prático

```sql
UPDATE funcionarios
SET salario = salario * 1.15
WHERE departamento = 'TI'
RETURNING id_func, nome, salario AS novo_salario;
```

---

## 🛡️ Dicas de Segurança para Evitar Desastres com `UPDATE`

### 1. Teste o filtro com um `SELECT` primeiro
Antes de executar qualquer `UPDATE`, execute um `SELECT` com a exata mesma cláusula `WHERE` para verificar quais linhas serão afetadas.

```sql
-- 1º PASSO: Verifique quem será alterado
SELECT * FROM funcionarios WHERE departamento = 'Marketing' AND ativo = FALSE;

-- 2º PASSO: Execute o UPDATE com segurança
UPDATE funcionarios 
SET ativo = TRUE 
WHERE departamento = 'Marketing' AND ativo = FALSE;
```

### 2. Sempre utilize Transações (`BEGIN` / `ROLLBACK`)
Se você estiver operando em um banco de produção, abra uma transação antes de rodar o `UPDATE`. Assim, se algo der errado, você poderá desfazer com `ROLLBACK`.

```sql
-- Inicia a transação
BEGIN TRANSACTION;

-- Executa o update
UPDATE funcionarios
SET salario = 9000.00
WHERE departamento = 'TI';

-- Verifique o resultado
SELECT * FROM funcionarios WHERE departamento = 'TI';

-- Se deu errado:
-- ROLLBACK;

-- Se tudo estiver correto, confirme a gravação:
-- COMMIT;
```

---

## 🎯 Resumo das Boas Práticas

1. **Nunca esqueça do `WHERE`** (a menos que a intenção seja realmente alterar 100% dos registros).
2. **Faça backup ou use transações (`BEGIN` / `ROLLBACK`)** em operações em ambientes de produção.
3. **Crie Índices** nas colunas frequentemente utilizadas na cláusula `WHERE` para otimizar o tempo de execução do `UPDATE`.
4. **Cuidado com Triggers**: Atualizações em tabelas com *triggers* configuradas podem disparar outras ações em cadeia no banco de dados.