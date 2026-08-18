# 1. Instalação e Configuração

## 1.1. Instalação

Para instalar o postgresql no Windows, abra o terminal e execute o comando abaixo:

```shell
winget install -e --id PostgreSQL.PostgreSQL
```

## 1.2. Criando um banco de dados e configurando seu acesso:

Para criar um banco de dados no postgres:
```shell
createdb -h localhost -U postgres teste
```

Agora podemos logar como administrador e criar um usuário que será utilizado para acessar esse novo banco de dados:
```sql
psql -U postgres
CREATE USER teste WITH PASSWORD 'teste';
```

Podemos agora conferir permissões a esse usuário:
```sql
GRANT CONNECT ON DATABASE teste TO teste;
\c teste
GRANT CREATE, USAGE ON SCHEMA public TO teste;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO teste;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO teste;
```

ou torná-lo proprietário do banco de dados:

```sql
ALTER DATABASE teste OWNER TO teste;
\c teste
```


Quando quiser excluir o banco de dados teste:

```shell
dropdb -U teste teste
```

Agora sempre que precisarmos acessar o banco `teste` podemos fazer de forma direta:

```shell
psql -h localhost -p 5432 -U teste -d teste
```

# 2. SQL

SQL (Structured Query Language, ou Linguagem de Consulta Estruturada) é a linguagem padrão mundial para se comunicar com bancos de dados relacionais.Ela funciona como um tradutor: você escreve um comando em SQL e o sistema de banco de dados entende exatamente quais informações buscar, salvar, alterar ou deletar.

## 2.1. Sublinguagens do SQL: DDL, DML e DCL

O SQL (Structured Query Language) é dividido em sublinguagens funcionais para gerenciar a arquitetura do banco de dados, manipular registros e controlar permissões de acesso.

---

## 2.2. DDL (Data Definition Language - Linguagem de Definição de Dados)
Os comandos DDL definem, modificam e gerenciam o **esqueleto estrutural** do banco de dados (como tabelas, índices e esquemas), e não os dados em si.

* **`CREATE`**: Cria um novo objeto no banco de dados (ex: `CREATE TABLE funcionarios (...)`).
* **`ALTER`**: Modifica a estrutura de um objeto existente (ex: adicionar uma coluna).
* **`DROP`**: Exclui permanentemente um objeto inteiro do banco de dados.
* **`TRUNCATE`**: Remove todas as linhas de uma tabela, limpando o conteúdo mas mantendo a estrutura original intacta.

## 2.3. DML (Data Manipulation Language - Linguagem de Manipulação de Dados)
Os comandos DML lidam diretamente com o **conteúdo dos dados** armazenados dentro das estruturas, permitindo gerenciar os registros.

* **`INSERT`**: Adiciona novos registros ou linhas a uma tabela.
* **`UPDATE`**: Modifica valores ou linhas existentes com base em condições específicas.
* **`DELETE`**: Remove registros específicos de uma tabela.
* *Nota: O comando `SELECT` é frequentemente classificado aqui por recuperar dados, embora às vezes seja isolado em uma categoria própria chamada **DQL** (Data Query Language).*

## 2.4. DCL (Data Control Language - Linguagem de Controle de Dados)
Os comandos DCL gerenciam os **direitos administrativos, segurança e permissões de acesso** dos usuários no sistema de banco de dados.

* **`GRANT`**: Concede permissões explícitas a um usuário ou perfil (ex: permitir leitura ou escrita em uma tabela).
* **`REVOKE`**: Remove permissões que foram previamente concedidas a um usuário ou perfil.

---

## Tabela Comparativa

| Sublinguagem | Foco Principal | Alvo | Comandos Principais |
| :--- | :--- | :--- | :--- |
| **DDL** | Estrutura do Banco | Tabelas, Views, Schemas | `CREATE`, `ALTER`, `DROP` |
| **DML** | Conteúdo dos Dados | Linhas, Registros | `INSERT`, `UPDATE`, `DELETE` |
| **DCL** | Segurança e Acesso | Usuários, Perfis / Roles | `GRANT`, `REVOKE` |

# 3. Comandos DDL

## 3.1. Comando CREATE TABLE no PostgreSQL

O comando **`CREATE TABLE`** é utilizado para criar uma nova tabela no banco de dados.

### Sintaxe Básica

```sql
CREATE TABLE nome_da_tabela (
    coluna1 tipo_de_dado restricao,
    coluna2 tipo_de_dado,
    coluna3 tipo_de_dado
);
```

---

### Exemplo Prático

Abaixo está um exemplo de script estruturado com boas práticas, incluindo chaves primárias automáticas, restrições de validação e valores padrão:

```sql
CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE
);
```

### Explicação dos Componentes

*   **`IF NOT EXISTS`**: Evita erros caso a tabela já tenha sido criada antes.
*   **`SERIAL`**: Gera números inteiros sequenciais automáticos para cada novo registro.
*   **`PRIMARY KEY`**: Define a coluna como o identificador único e obrigatório da tabela.
*   **`VARCHAR(X)`**: Define um texto com limite máximo de caracteres (ex: 100 ou 150).
*   **`NOT NULL`**: Torna o preenchimento do campo obrigatório.
*   **`UNIQUE`**: Garante que o valor não seja duplicado no banco (ideal para e-mails ou CPF).
*   **`DEFAULT`**: Define um valor automático caso nenhum seja informado na inserção.
*   **`CURRENT_TIMESTAMP`**: Grava a data e hora exatas do momento em que o registro foi criado.

### Criando Relacionamentos no PostgreSQL (Chaves Estrangeiras)

Os relacionamentos entre tabelas no PostgreSQL são criados utilizando **Chaves Estrangeiras (`FOREIGN KEY`)**. Elas garantem a integridade referencial, impedindo que um registro aponte para um dado inexistente em outra tabela.

---

### Tipos de Relacionamentos e Exemplos Práticos

#### 3.1.1. Relacionamento Um-para-Muitos (1:N)
É o tipo mais comum. Um registro na Tabela A pode se relacionar com vários registros na Tabela B.
*Exemplo: Um usuário pode fazer muitos pedidos.*

```sql
-- Tabela Principal (Pai)
CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Relacionada (Filho)
CREATE TABLE IF NOT EXISTS pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Definição da Chave Estrangeira
    CONSTRAINT fk_usuario 
        FOREIGN KEY (usuario_id) 
        REFERENCES usuarios(id) 
        ON DELETE CASCADE
);
```

#### 3.1.2. Relacionamento Um-para-Um (1:1)
Cada registro na Tabela A se relaciona com exatamente um registro na Tabela B. Para isso, adiciona-se a restrição `UNIQUE` na chave estrangeira.
*Exemplo: Um usuário tem apenas um perfil detalhado.*

```sql
CREATE TABLE IF NOT EXISTS perfis (
    id SERIAL PRIMARY KEY,
    usuario_id INT UNIQUE NOT NULL, -- UNIQUE garante o relacionamento 1:1
    biografia TEXT,
    foto_url VARCHAR(255),
    
    CONSTRAINT fk_usuario_perfil 
        FOREIGN KEY (usuario_id) 
        REFERENCES usuarios(id) 
        ON DELETE CASCADE
);
```

#### 3.1.3. Relacionamento Muitos-para-Muitos (N:N)
Um registro na Tabela A pode se relacionar com vários na Tabela B, e vice-versa. Requer uma **tabela intermediária** (ou tabela de junção).
*Exemplo: Um produto pode pertencer a várias categorias, e uma categoria tem vários produtos.*

```sql
-- Tabela de Produtos
CREATE TABLE IF NOT EXISTS produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de Categorias
CREATE TABLE IF NOT EXISTS categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela Intermediária (Junção)
CREATE TABLE IF NOT EXISTS produtos_categorias (
    produto_id INT NOT NULL,
    categoria_id INT NOT NULL,
    
    -- A chave primária composta impede duplicidade da mesma relação
    PRIMARY KEY (produto_id, categoria_id),
    
    CONSTRAINT fk_produto 
        FOREIGN KEY (produto_id) 
        REFERENCES produtos(id) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_categoria 
        FOREIGN KEY (categoria_id) 
        REFERENCES categorias(id) 
        ON DELETE CASCADE
);
```

---

### Regras de Deleção (`ON DELETE`)

Ao apagar um registro na tabela principal (Pai), o que deve acontecer com os registros filhos? Você define isso na criação da chave estrangeira:

*   **`ON DELETE CASCADE`**: Apaga automaticamente todos os registros filhos vinculados.
*   **`ON DELETE RESTRICT` / `NO ACTION`**: Bloqueia a deleção no Pai caso existam registros filhos vinculados (é o padrão do PostgreSQL).
*   **`ON DELETE SET NULL`**: Mantém os registros filhos, mas altera o campo da chave estrangeira para `NULL`.
