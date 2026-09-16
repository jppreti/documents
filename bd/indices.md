# Índices

Um índice no PostgreSQL é uma estrutura de dados auxiliar que acelera a busca de linhas em uma tabela, funcionando de forma muito parecida com o índice remissivo no fim de um livro.

## Como Funcionam e Para Que Servem

Sem um índice, o PostgreSQL precisa fazer um Sequential Scan (varredura sequencial), lendo linha por linha da tabela inteira para encontrar um registro. Com o índice, ele vai direto à localização física do dado, economizando tempo de processamento.

- Vantagem: Acelera drasticamente consultas (SELECT) com filtros (WHERE), ordenações (ORDER BY) e junções (JOIN).
- Desvantagem: Ocupam espaço em disco e tornam operações de escrita (INSERT, UPDATE, DELETE) mais lentas, pois o índice precisa ser atualizado a cada alteração.

## Principais Tipos de Índices no PostgreSQL

O Postgres oferece diferentes algoritmos de indexação para cenários específicos:
- **B-Tree** (Padrão): Ideal para a maioria dos casos. Funciona com igualdade e intervalos (=, <, >, BETWEEN, IN). É criado automaticamente para chaves primárias (PRIMARY KEY).
- **Hash**: Otimizado exclusivamente para comparações de igualdade (=), oferecendo buscas rápidas baseadas em códigos hash.
- **GIN** (Generalized Inverted Index): Excelente para dados compostos ou com múltiplos valores por linha, como matrizes (arrays), documentos JSONB e pesquisas de texto completo (full-text search).
- **GiST** (Generalized Search Tree): Útil para dados geométricos (2D), de intervalo e buscas de proximidade.
- **BRIN** (Block Range Index): Muito leve e econômico em espaço, ideal para tabelas gigantescas onde os dados já estão naturalmente ordenados por inserção (como logs ou timestamps).

# DDL

Você cria um índice básico usando o comando: 

```sql
CREATE INDEX idx_usuarios_nome ON usuarios (nome);
```

Para especificar o tipo de índice no PostgreSQL, você deve usar a cláusula USING logo após o nome da tabela no comando de criação. A estrutura básica do comando é:

```sql
CREATE INDEX nome_do_indice ON nome_da_tabela USING tipo_do_indice (coluna);
```

Se não colocar a cláusula USING, o PostgreSQL criará um índice do tipo B-Tree por padrão.

Segue exemplos de criação:

```sql
CREATE INDEX idx_usuarios_email     ON usuarios USING hash (email);
CREATE INDEX idx_produtos_detalhes  ON produtos USING gin (detalhes_jsonb);
CREATE INDEX idx_logs_criado_em     ON logs     USING brin (criado_em);
CREATE INDEX idx_lojas_localizacao  ON lojas    USING gist (coordenadas_geograficas);
```

