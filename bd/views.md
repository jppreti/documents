
# Views

Views são consideradas pseudo-tabelas, ou seja, elas são usadas junto a instrução SELECT para apresentar subconjuntos de dados presentes em tabelas reais. Assim, podemos apresentar as colunas e linhas que foram selecionadas da tabela original ou associada. E como as Views possuem permissões separadas, podemos utilizá-las para restringir mais o acesso aos dados pelos usuários, para que veja apenas o que é necessário.

Segue a sintaxe básica de uma view:

```sql
CREATE [ OR REPLACE ] [ TEMP | TEMPORARY ] VIEW name
    [ ( column_name [, ...] ) ]
    [ WITH ( view_option_name [= view_option_value] [, ... ] ) ]
    AS query
    [ WITH [ CASCADED | LOCAL ] CHECK OPTION ]
```

O código começa com a instrução de criação CREATE VIEW. E como ela é virtual, sempre que uma consulta é executada, a View é referenciada na consulta.

O parâmetro [ TEMPORARY | TEMP ] é especificado quando queremos que a View seja temporária, as quais são eliminadas de forma automática quando a sessão atual é finalizada. Caso tenhamos referenciado tabelas temporárias para a View, esta será criada como temporária mesmo que não tenhamos especificado este parâmetro.

O `name` é o nome da View, podendo este ser opcional já o `column_name`, que é uma lista opcional que contém os nomes a serem utilizados para as colunas da View.

Exemplo:

```sql
CREATE VIEW view_usuario AS SELECT * FROM usuario;
```

Uma View é um objeto que permite a visualização de dados da tabela a qual esteja associada. Como ela não existe por conta própria, é criada com base em consultas nas tabelas para selecionar colunas, dando assim acessos restritos ou com privilégios. Além disso possuem a capacidade de juntar informações contidas em diversas tabelas para representar em um único lugar como, por exemplo, na geração de relatórios.

Devido as suas especificações de restrição, os dados retornados são apenas aqueles que o usuário pode ver. E por serem tabelas virtuais, não podemos realizar por elas as operações DML de inserção, atualização e exclusão, mas sim apenas usando o SELECT.

Para excluir uma view usamos o seguinte comando:

```sql
DROP VIEW view_usuario;
```

## Views Materializadas

Como as Views são apenas para leitura e representação lógica dos dados que estão armazenados nas tabelas do banco de dados, podemos “materializar”, ou seja, armazená-las fisicamente no disco.

A criação dessas Views, ao invés de novas tabelas, melhora o desempenho em operações de leitura. Os dados das Views materializadas serão então armazenados em uma tabela que pode ser indexada rapidamente quando esta for associada e também em momentos que precisemos atualizar as Views materializadas. Isso ocorre com frequência em Data warehouse e aplicações de Business Intelligence, por exemplo.

Ao contrário da View tradicional, que nos apresentam dados atualizados automaticamente, as Views materializadas precisam de um mecanismo de atualização. A sintaxe é apresentada abaixo:

```sql
CREATE MATERIALIZED VIEW table_name
        [ (column_name [, ...] ) ]
        [ WITH ( storage_parameter [= value] [, ... ] ) ]
        [ TABLESPACE tablespace_name ]
        AS query
        [ WITH [ NO ] DATA ]
```

A instrução CREATE MATERIALIZED VIEW cria View e a consulta é executada para preenche-la. Para atualizar os dados usamos o comando REFRESH MATERIALIZED VIEW. Uma View materializada tem muitas das mesmas propriedades de uma tabela, mas não há suporte para materialização temporária ou geração automática de OIDs.

O parâmetro TABLESPACE tablespace_name é o nome do espaço de tabelas no qual a nova View materializada deve ser criada. Se este não for especificado, a consulta será realizada no default_tablespace.

Com base no exemplo que desenvolvemos nesse artigo, a instrução a seguir cria uma view materializada para a tabela usuario:

CREATE MATERIALIZED VIEW view_materializada_usuario AS SELECT * FROM usuario WITH NO DATA;

Agora utilizaremos o comando SELECT para verificarmos se os registros foram realmente inseridos com sucesso:

```sql
SELECT * FROM view_materializada_usuario;
```

Podemos ver que obtivemos um erro ao tentarmos consultar a nossa View. Este erro ocorreu porque a view não se atualizou automaticamente, então precisamos do comando Refresh Materialized View:

```sql
REFRESH MATERIALIZED VIEW view_materializada_usuario;
```

Feito isso, e em seguida, tentando consultar novamente os dados e assim obtemos êxito.
