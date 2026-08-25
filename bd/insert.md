# Comando `INSERT` do SQL

O comando **`INSERT`** faz parte da DML (*Data Manipulation Language*) do SQL e é utilizado para adicionar novos registros (linhas) em uma tabela de um banco de dados relacional.

Neste guia, você aprenderá desde a sintaxe básica até técnicas avançadas de inserção de dados.

---

## 🛠️ Tabela de Exemplo (`produtos`)

Para os exemplos práticos deste tutorial, considere uma tabela chamada `produtos` com a seguinte estrutura:

| Coluna | Tipo de Dado | Restrição / Descrição |
| :--- | :--- | :--- |
| `id_produto` | INT / SERIAL | Chave Primária (Auto-incremento) |
| `nome` | VARCHAR(100) | NOT NULL (Obrigatório) |
| `categoria` | VARCHAR(50) | Nome da categoria do produto |
| `preco` | DECIMAL(10,2)| Preço do produto |
| `estoque` | INT | Quantidade em estoque (Default: 0) |
| `ativo` | BOOLEAN | `TRUE` ou `FALSE` (Default: `TRUE`) |

---

## 1. Inserção Básica (Específica por Coluna)

A forma mais recomendada e segura de utilizar o `INSERT` é especificando explicitamente os nomes das colunas e os respectivos valores.

### Sintaxe

```sql
INSERT INTO nome_da_tabela (coluna1, coluna2, coluna3)
VALUES (valor1, valor2, valor3);
```

### Exemplo Prático

```sql
INSERT INTO produtos (nome, categoria, preco, estoque, ativo)
VALUES ('Teclado Mecânico', 'Periféricos', 250.00, 15, TRUE);
```

> 📌 **Por que especificar as colunas?**  
> Se a estrutura da tabela for alterada no futuro (ex: adição ou remoção de colunas), sua query não quebrará, pois o banco saberá exatamente para qual coluna cada valor deve ir.

---

## 2. Inserção Curta (Omitindo os Nomes das Colunas)

Você pode omitir os nomes das colunas se fornecer valores para **todas as colunas da tabela**, exatamente na **mesma ordem** em que foram criadas no banco.

### Sintaxe

```sql
INSERT INTO nome_da_tabela
VALUES (valor_coluna1, valor_coluna2, valor_coluna3, ...);
```

### Exemplo Prático

```sql
-- Assumindo que id_produto é auto-gerado (DEFAULT/NULL dependendo do SGDB)
INSERT INTO produtos
VALUES (DEFAULT, 'Mouse Gamer', 'Periféricos', 150.00, 30, TRUE);
```

> ⚠️ **Atenção:** Essa abordagem **não é recomendada** em ambientes de produção ou código de aplicações, pois pequenas alterações no schema da tabela farão a consulta falhar.

---

## 3. Inserção Múltipla (Em Lote / Bulk Insert)

Para inserir vários registros de uma só vez sem precisar executar o comando `INSERT` repetidas vezes, basta separar os conjuntos de valores por vírgula.

### Benefício
Executar uma única instrução com múltiplos valores melhora significativamente a performance e reduz o tráfego na rede e a carga no servidor.

### Exemplo Prático

```sql
INSERT INTO produtos (nome, categoria, preco, estoque, ativo)
VALUES 
    ('Monitor 24 polegadas', 'Monitores', 899.90, 10, TRUE),
    ('Headset Sem Fio', 'Áudio', 350.00, 20, TRUE),
    ('Cadeira Ergonômica', 'Móveis', 1200.00, 5, TRUE),
    ('Webcam Full HD', 'Periféricos', 199.00, 0, FALSE);
```

---

## 4. Inserindo Valores Parciais (Uso de Valores Padrão / DEFAULT)

Se você omitir colunas que possuem valores padrão (`DEFAULT`) configurados no banco ou que aceitam valores nulos (`NULL`), o banco de dados preencherá essas colunas automaticamente.

### Exemplo Prático

```sql
-- As colunas 'estoque' (Padrão: 0) e 'ativo' (Padrão: TRUE) serão preenchidas automaticamente
INSERT INTO produtos (nome, categoria, preco)
VALUES ('Mousepad Extra Grande', 'Acessórios', 49.90);
```

Você também pode forçar o valor padrão usando explicitamente a palavra-chave `DEFAULT`:

```sql
INSERT INTO produtos (nome, categoria, preco, estoque, ativo)
VALUES ('Suporte para Monitor', 'Acessórios', 89.90, DEFAULT, DEFAULT);
```

---

--## 5. Inserção a Partir de uma Consulta (`INSERT INTO ... SELECT`)

--Você pode preencher uma tabela copiando dados diretamente de outra tabela (ou da mesma tabela com filtros).

--### Sintaxe

--```sql
--INSERT INTO tabela_destino (coluna1, coluna2)
--SELECT coluna1, coluna2
--FROM tabela_origem
--WHERE condicao;
```

--### Exemplo Prático

--Considere que criamos uma tabela `produtos_promocao`. Podemos copiar os produtos em estoque para ela:

--```sql
--INSERT INTO produtos_promocao (nome_produto, preco_original)
--SELECT nome, preco
--FROM produtos
--WHERE estoque > 0 AND ativo = TRUE;
--```

---

## 6. Recursos Avançados por Sistema Gerenciador (SGDB)

Diferentes bancos de dados oferecem cláusulas especiais para manipular conflitos de chave primária ou retornar dados inseridos.

### A. Retornar Dados Inseridos (`RETURNING`) — PostgreSQL / Oracle / SQLite

Retorna os valores gravados no banco imediatamente após o encerramento do `INSERT` (muito útil para pegar IDs gerados automaticamente).

```sql
INSERT INTO produtos (nome, categoria, preco, estoque)
VALUES ('Microfone USB', 'Áudio', 299.90, 8)
RETURNING id_produto, nome;
```

### B. Inserir ou Atualizar em Caso de Conflito ("Upsert")

#### PostgreSQL / SQLite (`ON CONFLICT`):
```sql
INSERT INTO produtos (id_produto, nome, preco, estoque)
VALUES (1, 'Teclado Mecânico RGB', 280.00, 20)
ON CONFLICT (id_produto) 
DO UPDATE SET 
    preco = EXCLUDED.preco,
    estoque = EXCLUDED.estoque;
```

#### MySQL (`ON DUPLICATE KEY UPDATE`):
```sql
INSERT INTO produtos (id_produto, nome, preco, estoque)
VALUES (1, 'Teclado Mecânico RGB', 280.00, 20)
ON DUPLICATE KEY UPDATE 
    preco = VALUES(preco),
    estoque = VALUES(estoque);
```

---

## 🎯 Boas Práticas ao Utilizar o `INSERT`

1. **Especifique as colunas explicitamente**: Sempre liste os nomes das colunas `(col1, col2)` para garantir robustez do código.
2. **Use Inserção Múltipla para grandes volumes**: Insira centenas ou milhares de linhas em uma única instrução `INSERT` para otimizar o I/O do banco de dados.
3. **Gerencie Transações (`BEGIN` / `COMMIT`)**: Para operações críticas envolvendo múltiplos `INSERTs`, utilize transações para evitar gravações parciais em caso de falha.
4. **Cuidado com tipos de dados**:
   * **Textos/Datas**: Devem estar entre aspas simples (`'Texto'`, `'2026-08-25'`).
   * **Números/Decimais**: Usam ponto como separador decimal (`1500.50`), sem aspas.
   * **Booleans**: Usam `TRUE`/`FALSE` ou `1`/`0`.