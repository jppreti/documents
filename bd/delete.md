# Comando `DELETE` do SQL

O comando **`DELETE`** faz parte da DML (*Data Manipulation Language*) do SQL e é utilizado para **remover um ou mais registros (linhas)** existentes em uma tabela do banco de dados relacional.

Neste guia, você aprenderá desde a sintaxe básica até comparações importantes de performance e práticas essenciais de segurança.

---

## 🛠️ Tabela de Exemplo (`pedidos`)

Para os exemplos práticos deste tutorial, considere uma tabela chamada `pedidos` com a seguinte estrutura:

| id_pedido | cliente | data_pedido | valor_total | status |
| :---: | :--- | :---: | :---: | :---: |
| 101 | João Santos | 2026-01-10 | 150.00 | Cancelado |
| 102 | Maria Souza | 2026-02-15 | 450.00 | Entregue |
| 103 | Carlos Lima | 2026-03-01 | 89.90 | Pendente |
| 104 | Ana Pereira | 2026-03-05 | 1200.00 | Cancelado |

---

## ⚠️ A Regra de Ouro do `DELETE`

> **SEMPRE UTILIZE A CLÁUSULA `WHERE`!**
> 
> Se você executar `DELETE FROM pedidos;` sem a cláusula `WHERE`, **TODAS as linhas da tabela serão apagadas permanentemente!**

---

## 1. Deletando um Único Registro (Por ID ou Chave Primária)

A forma mais comum e segura de remoção é especificar a chave primária do registro que você deseja apagar.

### Sintaxe

```sql
DELETE FROM nome_da_tabela
WHERE chave_primaria = valor;
```

### Exemplo Prático

Remover o pedido com ID 101:

```sql
DELETE FROM pedidos
WHERE id_pedido = 101;
```

---

## 2. Deletando Registros com Múltiplas Condições

Você pode usar operadores lógicos (`AND`, `OR`, `NOT`) para filtrar quais linhas devem ser removidas com base em critérios mais complexos.

### Exemplo Prático: Remover pedidos cancelados com valor abaixo de 200

```sql
DELETE FROM pedidos
WHERE status = 'Cancelado' AND valor_total < 200.00;
```

### Exemplo Prático: Remover pedidos de status 'Cancelado' ou 'Pendente'

```sql
DELETE FROM pedidos
WHERE status IN ('Cancelado', 'Pendente');
```

---

## 3. Deletando com Base em Datas (`BETWEEN` / Operadores de Comparação)

O comando `DELETE` é amplamente utilizado para limpeza de histórico e dados antigos.

### Exemplo Prático: Excluir pedidos cancelados antes de uma determinada data

```sql
DELETE FROM pedidos
WHERE status = 'Cancelado' AND data_pedido < '2026-02-01';
```

---

## 4. Deletando Registros usando Subconsultas (`Subqueries`)

Você pode deletar registros em uma tabela com base no resultado de uma consulta em outra tabela.

### Exemplo Prático

Apagar todos os pedidos de clientes que foram marcados como "Inativos" na tabela `clientes`:

```sql
DELETE FROM pedidos
WHERE id_cliente IN (
    SELECT id_cliente 
    FROM clientes 
    WHERE status = 'Inativo'
);
```

---

## 5. Limitação de Linhas Deletadas (`LIMIT`)

Em bancos de dados como o **MySQL** e **MariaDB**, você pode limitar a quantidade de registros que serão deletados de uma vez. Isso é ideal para apagar grandes volumes de dados aos poucos sem travar o banco.

### Exemplo Prático: Apagar no máximo 100 pedidos cancelados por execução

```sql
DELETE FROM pedidos
WHERE status = 'Cancelado'
LIMIT 100;
```

---

## 6. Retornando os Dados Removidos (`RETURNING`)

Disponível em SGBDs como **PostgreSQL**, **Oracle** e **SQLite**, a cláusula `RETURNING` permite visualizar exatamente quais linhas foram excluídas da tabela.

### Exemplo Prático

```sql
DELETE FROM pedidos
WHERE status = 'Cancelado'
RETURNING id_pedido, cliente, valor_total;
```

---

## 🆚 `DELETE` vs `TRUNCATE` vs `DROP`

É essencial entender a diferença entre esses três comandos para não cometer erros graves:

| Comando | Tipo | Permite `WHERE`? | Pode fazer `ROLLBACK`? | Descrição |
| :--- | :---: | :---: | :---: | :--- |
| **`DELETE`** | DML | **Sim** | **Sim** | Remove linhas específicas uma a uma. Mantém a estrutura da tabela e o contador de auto-incremento. |
| **`TRUNCATE`**| DDL | Não | Depende do SGBD | Apaga **todas** as linhas da tabela de forma rápida e reseta os contadores de ID. |
| **`DROP`** | DDL | Não | Não | **Destrói a tabela inteira** junto com sua estrutura, índices e permissões. |

---

## 🛡️ Dicas de Segurança Indispensáveis

### 1. Teste o filtro com `SELECT` primeiro!
Antes de executar o `DELETE`, transforme a instrução em um `SELECT` com a exata mesma cláusula `WHERE` para ter certeza de quais linhas serão deletadas.

```sql
-- 1º PASSO: Verifique o que será excluído
SELECT * FROM pedidos WHERE status = 'Cancelado' AND data_pedido < '2026-01-01';

-- 2º PASSO: Execute o DELETE com segurança
DELETE FROM pedidos WHERE status = 'Cancelado' AND data_pedido < '2026-01-01';
```

### 2. Sempre use Transações (`BEGIN TRANSACTION` / `ROLLBACK`)
Em ambientes de produção, execute o `DELETE` dentro de um bloco de transação. Se algo der errado ou afetar mais linhas do que o esperado, você poderá desfazer.

```sql
-- Inicia a transação
BEGIN TRANSACTION;

-- Executa o delete
DELETE FROM pedidos WHERE status = 'Cancelado';

-- Confera o número de linhas afetadas ou faça um SELECT de verificação
-- Se algo deu errado:
-- ROLLBACK;

-- Se estiver tudo correto:
-- COMMIT;
```