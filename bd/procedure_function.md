# Stored Procedure e Function

No PostgreSQL, uma `Stored Procedure` ou `Function` é um objeto do banco de dados que agrupa um conjunto de comandos SQL e lógica procedural para executar tarefas repetitivas ou complexas diretamente no servidor.

A partir do PostgreSQL 11, os procedimentos são criados com o comando CREATE PROCEDURE e possuem um diferencial: eles oferecem suporte nativo a transações, permitindo executar comandos como COMMIT e ROLLBACK dentro do próprio código. Funções não permitem o gerenciamento de transações.

## Diferença entre Procedure e Function

|Característica|Stored Procedure|Function|
|---|------------|------------|
|Como executar|Chamada via comando CALL|Chamada via SELECT ou expressões|
|Retorno|Não retorna valor diretamente (usa parâmetros OUT/INOUT)|Sempre retorna um valor ou conjunto de dados (RETURNS)|
|Transações|Permite usar COMMIT e ROLLBACK internamente|Não permite (roda dentro da transação do comando que a chamou)|

## Estrutura Básica e Sintaxe

Para escrever procedimentos, a linguagem padrão mais utilizada é a PL/pgSQL. A estrutura básica segue este modelo:

```sql
CREATE OR REPLACE PROCEDURE nome_da_procedure(parametro1 tipo, parametro2 tipo)
LANGUAGE plpgsql
AS $$
DECLARE
    -- Declaração de variáveis locais (opcional)
    minha_variavel INT;
BEGIN
    -- Corpo do código (Instruções SQL e lógica)
    
    -- Exemplo de controle de transação
    IF parametro1 < 0 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END;
$$;
```

## Exemplos Práticos

### Criando uma Procedure Simples (Sem retorno)

Este procedimento insere um novo produto em uma tabela fictícia e faz o commit imediato da transação.

```sql
CREATE OR REPLACE PROCEDURE inserir_produto(p_nome VARCHAR, p_preco NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO produtos (nome, preco, criado_em) 
    VALUES (p_nome, p_preco, NOW());
    
    -- Confirma a inserção imediatamente
    COMMIT; 
END;
$$;
```

Como executar:

```sql
CALL inserir_produto('Teclado Mecânico', 350.00);
```

### Usando Parâmetros de Saída (INOUT)

Diferente das funções, as procedures não usam a cláusula RETURNS. Para extrair dados de uma procedure, utilizamos parâmetros do tipo INOUT ou OUT.

```sql
CREATE OR REPLACE PROCEDURE calcular_desconto(
    p_id_produto INT, 
    INOUT p_preco_com_desconto NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Aplica 10% de desconto baseado no preço atual do produto
    SELECT preco * 0.90 INTO p_preco_com_desconto 
    FROM produtos 
    WHERE id = p_id_produto;
END;
$$;
```

Como executar:

```sql
-- Passamos um valor inicial para o parâmetro INOUT
CALL calcular_desconto(1, 0.00); 
```

## Vantagens de utilizar Stored Procedures

**Redução de tráfego de rede**: Toda a lógica roda diretamente no servidor do PostgreSQL, evitando múltiplas requisições de ida e volta da aplicação. 

**Segurança**: Permite restringir o acesso direto às tabelas, concedendo aos usuários apenas a permissão de executar o procedimento (GRANT EXECUTE).

**Manutenibilidade**: Altera-se a regra de negócio centralizada no banco sem a necessidade de recompilar ou fazer novos deploys no ecossistema da aplicação.

## Desvantagens

**Portabilidade**: A substituição do banco de dados por um concorrente é desafiadora, tendo em vista que a lógica de negócio está implementada diretamente no banco de dados.

## Function

Enquanto a Procedure é chamada com CALL e não possui retorno obrigatório, a FUNCTION é chamada via SELECT e sempre precisa retornar um valor ou uma tabela.

Segue um exemplo prático de uma função que calcula o imposto (ou acréscimo) sobre o valor de um produto baseado em uma porcentagem informada:

```sql
CREATE OR REPLACE FUNCTION calcular_preco_final(
    p_preco_base NUMERIC,
    p_porcentagem_imposto NUMERIC
)
RETURNS NUMERIC -- Define o tipo de dado que a função vai devolver
LANGUAGE plpgsql
AS $$
DECLARE
    -- Declaração de variáveis locais
    v_valor_imposto NUMERIC;
    v_preco_final NUMERIC;
BEGIN
    -- Validação simples para evitar valores negativos
    IF p_preco_base < 0 OR p_porcentagem_imposto < 0 THEN
        RAISE EXCEPTION 'O preço e o imposto não podem ser negativos!';
    END IF;

    -- Lógica do cálculo
    v_valor_imposto := p_preco_base * (p_porcentagem_imposto / 100);
    v_preco_final   := p_preco_base + v_valor_imposto;

    -- Retorna o resultado final
    RETURN ROUND(v_preco_final, 2);
END;
$$;
```

### Como Executar (Chamar a Função)

Diferente das procedures, você usa o comando SELECT para rodar uma função:

```sql
-- Exemplo passando um produto de R$ 100,00 com 15% de imposto
SELECT calcular_preco_final(100.00, 15.0);
```

### Usando a função diretamente em uma tabela

Você também pode aplicar essa função diretamente nas colunas de uma tabela existente em consultas:

```sql
SELECT 
    nome_produto, 
    preco, 
    calcular_preco_final(preco, 12.5) AS preco_com_icms
FROM produtos;
```