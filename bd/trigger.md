# Trigger (Gatilho)

Triggers em banco de dados são as operações realizadas de forma espontânea para eventos específicos. Quando tratamos dos eventos, estes podem ser tanto um INSERT quanto um UPDATE, ou mesmo um DELETE. Assim, podemos definir determinadas operações que serão realizadas sempre que o evento ocorrer.

Quando nos referirmos a uma operação com uma trigger, esta é conhecida por função de trigger. Trigger e função de trigger são duas coisas diferentes, onde a primeira pode ser criada utilizando a instrução CREATE TRIGGER, enquanto que a última é definida pelo comando CREATE FUNCTION. Em linhas gerais, com as triggers definimos qual tarefa executar, e com as triggers de função definimos como essa tarefa será realizada.

Sintaxe de uma função de trigger:

```sql
CREATE OR REPLACE FUNCTION trigger_function_name
RETURNS trigger AS $ExemploFuncao$
BEGIN
/* Aqui definimos nossos códigos.*/
RETURN NEW;
END;
$ExemploFuncao
```

Sintaxe de uma trigger:

```sql
CREATE [ CONSTRAINT ] TRIGGER NAME { BEFORE | AFTER | INSTEAD OF } { event [ OR ... ] }
ON table_NAME
[ FROM referenced_table_NAME ]
[ NOT DEFERRABLE | [ DEFERRABLE ] { INITIALLY IMMEDIATE | INITIALLY DEFERRED } ]
[ FOR [ EACH ] { ROW | STATEMENT } ]
[ WHEN ( condition ) ]
EXECUTE PROCEDURE function_NAME ( arguments )
-- Quando um evento for declarado com:
INSERT
UPDATE [ OF column_NAME [, ... ] ]
DELETE
TRUNCATE
```

Repare que uma trigger function é, na realidade, uma função no PostgreSQL, mas com a diferença de que ela não recebe argumentos, e sim uma estrutura de dados especial chamada de TriggerData. Repare também que o seu tipo de retorno é a trigger, onde ela é chamada automaticamente no momento da ocorrência dos eventos (que podem ser INSERT, UPDATE, DELETE ou TRUNCATE). Com o PostgreSQL temos dois tipos de trigger disponíveis: trigger de nível de linha (row-level Trigger) e a trigger a nível de instrução (statement level trigger). Ambos são especificados com a utilização das cláusulas FOR EACH ROW (nível gatilho de linha) e FOR EACH STATEMENT, respectivamente. A utilização delas pode ser definida de acordo com a quantidade de vezes que a trigger deverá ser executada. Por exemplo, se uma instrução UPDATE for executada, e esta afetar seis linhas, temos que a trigger de nível de linha será executada seis vezes, enquanto que a trigger a nível de instrução será chamada apenas uma vez por instrução SQL.

Quando utilizamos triggers podemos conectá-las tanto a tabelas quanto a Views, de forma que as triggers são executadas para as tabelas em duas situações: BEFORE e AFTER, para qualquer uma das instruções DML (INSERT, UPDATE, DELETE), além de também possibilitar a sua execução utilizando a declaração TRUNCATE.

Quando temos a trigger definida com a instrução INSTEAD OF podemos utilizar as DML’s para as Views. As triggers serão disparadas antes ou depois das instruções DML, mas podem ser definidas apenas a nível de instrução. Já quando utilizamos o INSTEAD OF nas instruções DML, podemos executá-las apenas a nível de linha.

Com relação aos demais parâmetros, temos o NAME, que é utilizado para atribuirmos um nome para a trigger, o qual deve ser distinto das demais triggers criadas para a mesma tabela. A instrução table_NAME apresenta o nome da tabela em uso.

Quanto aos eventos (events), estes podem ser INSERT, UPDATE, DELETE ou TRUNCATE, os quais especificam o evento que irá disparar a trigger.

A expressão condition é uma expressão booleana que determina se a trigger function será executada. Se a condição WHEN for especificada, a função será chamada se a condição retornar true. Além disso, ela pode ser referida a colunas que contenham os valores antigos e se quer passar os novos valores. Para isso são utilizadas as instruções OLD.column_NAME ou NEW.column_NAME, respectivamente. Lembre-se que as function_names são funções fornecidas pelos usuários.

Por último, temos os arguments, que são listas opcionais de argumentos separados por vírgulas que podem ser fornecidos para a função quando a trigger for executada.

Após a criação da nossa tabela principal criaremos uma nova tabela com o nome de log_usuario, que será responsável por manter o histórico das alterações realizadas nos registros, como podemos ver na Listagem 4.

```sql
CREATE TABLE log_usuario (
    idusuario INT NOT NULL,
    data_operacao TIMESTAMP NOT NULL
);
```

Observe que há apenas dois campos: o código do usuário e a data da alteração/criação do registro, que receberá uma data no formato Timestamp no momento em que o registro for criado na tabela de Funcionários.

As triggers functions recebem, através de uma entrada especial, uma estrutura TriggerData, que possui um conjunto de variáveis locais que podemos usar nas nossas triggers functions. Dentre as variáveis presentes nesta estrutura temos as variáveis OLD e NEW, além de outras que começam com o prefixo TG_, como TG_TABLE_NAME.

A variável NEW é do tipo RECORD e contém uma nova linha a ser armazenada com base nos comandos INSERT/UPDATE das triggers a nível de linha.

Já a variável OLD também é do tipo RECORD e armazena a linha antiga quando utilizada com os comandos UPDATE/DELETE nas triggers de linha.

Após a criação das nossas tabelas definiremos uma trigger function, a qual chamaremos de usuario_log_func, e será responsável por registrar as alterações feitas na tabela de usuario:

```sql
CREATE OR REPLACE FUNCTION usuario_log_func()
RETURNS trigger AS $usuario_trigger$
BEGIN
    INSERT INTO log_usuario (idusuario, data_operacao)
    VALUES (NEW.id, CURRENT_TIMESTAMP);
    
    RETURN NEW;
END;
$usuario_trigger$ LANGUAGE plpgsql;
```

Com a nossa função criada, definiremos agora a nossa trigger e em seguida, a associaremos a tabela usuario:

```sql
CREATE TRIGGER log_trigger_usuario
AFTER INSERT ON usuario
FOR EACH ROW
EXECUTE PROCEDURE usuario_log_func();
```

Ao inserirmos um novo registro na nossa tabela usuario, podemos ver que um novo registro foi criado também na tabela log_usuario.

Para um exemplo um pouco mais complexo criaremos uma trigger contendo as três operações DML’s contidas numa mesma trigger function. Para isso, realizaremos inicialmente uma alteração na nossa tabela log_usuario, onde adicionaremos uma nova coluna operacao para armazenar o nome da operação realizada.

```sql
ALTER TABLE log_usuario
ADD COLUMN operacao VARCHAR(150);
```

Vamos recriar a trigger function:

```sql
CREATE OR REPLACE FUNCTION usuario_log_function()
RETURNS trigger AS $usuario_trigger$
BEGIN
    -- Aqui temos um bloco IF que confirmará o tipo de operação.
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO log_usuario (idusuario, data_operacao, operacao)
        VALUES (new.id, CURRENT_TIMESTAMP, 'Operação de inserção. A linha de código ' || NEW.id || ' foi inserida.');
        RETURN NEW;
    -- Aqui temos um bloco IF que confirmará o tipo de operação UPDATE.
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO log_usuario (idusuario, data_operacao, operacao)
        VALUES (NEW.id, CURRENT_TIMESTAMP, 'Operação de UPDATE. A linha de código ' || NEW.id || ' teve os valores atualizados ' || OLD || ' por ' || NEW.* || '.');
        RETURN NEW;
    -- Aqui temos um bloco IF que confirmará o tipo de operação DELETE
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO log_usuario (idusuario, data_operacao, operacao)
        VALUES (OLD.id, CURRENT_TIMESTAMP, 'Operação DELETE. A linha de código ' || OLD.id || ' foi excluída.');
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$usuario_trigger$ LANGUAGE plpgsql;
```

Agora criaremos a trigger que será vinculada a tabela usuario:

```sql
CREATE TRIGGER log_trigger_usuario_todas_as_operacoes
AFTER INSERT OR UPDATE OR DELETE ON usuario
FOR EACH ROW
EXECUTE PROCEDURE usuario_log_function();
```
