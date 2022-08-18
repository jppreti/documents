# 1. Introdução

## 1.1. O que é?

Trata-se de uma linguagem de programação popular. Foi criada por Guido Van Rossum em 1991.

## 1.2. Aonde é utilizada?

Popularmente é uma linguagem utilizada no desenvolvimento de software, bem como de aplicações web, sendo muito utilizada no campo da matemática computacional e na criação de scripts de sistema.

## 1.3. O que é capaz de realizar?

Python é uma linguagem de programação de sintaxe simples, mas poderosa e pode:

- ser utilizada no lado servidor para criar aplicações web;
- conectar a bancos de dados, ler e modificar arquivos;
- manipular grandes volumes de dados e realizar complexas operações matemáticas;
- ser utilizada para rápida prototipação.

## 1.4. Por que Python?

Há diversos pontos que favorecem a escolha dessa linguagem, dentre eles:

- executa em diferentes plataformas (Windows, Mac, Linux, Raspberry Pi, …);
- possui sintaxe simples e similar a língua inglesa;
- a sintaxe permite escrever programas com reduzido número de linhas se comparado a outras linguagens;
- é interpretada, o que significa que o código pode ser executado logo que é escrito;
- o código pode ser escrito de forma procedural, orientado a objeto ou funcional.

## 1.5. Outras Considerações Importantes

É possível desenvolver em Python por meio de qualquer editor de texto, mas existem diversas IDEs profissinais no mercado, como Thonny, Pycharm, Netbeans ou Eclipse que são particularmente úteis no gerenciamento de um grande número de arquivos python.

Python utiliza a quebra de linha para completar um comando, ao contrário de outras linguagens de programação que normalmente utilizam ponto e vírgula `;` ou parênteses `()`.

Em Python a identação é obrigatória para definir o escopo da(s) instrução(ões), como de laços, funções e classes. Outras linguagens de programação normalmente utilizam chaves `{}` para esse propósito.

## 1.6. Instalação

Faça o download e instalação da última versão de Python em [Download Python | Python.org](https://www.python.org/downloads/).

Se quiser verificar se já está instalado em sua máquina ou verificar a versão, abra o terminal (prompt de comando) e digite o comando:

```shell
python3 --version
```

## 1.7. Olá Mundo!

Para fazer um teste e saber como executar seus códigos em python, crie um arquivo `ola_mundo.py` em qualquer editor de texto *plain text* com o seguinte conteúdo:

```python
print('Olá Mundo!')
```

Salve, abra o terminal e execute por meio do comando:

```shell
python3 ola_mundo.py
```

Caso queira executar o programa em python e permanecer no interpretador, basta adicionar o parâmetro `-i`.

```shell
python3 -i ola_mundo.py
```

## 1.8. Interpretador

Para ativar o interpretador Python e programar executando imediatamente após ter digitado a linha, basta digitar o comando `python3` sem qualquer parâmetro no terminal.

Para sair do interpretador basta digitar o comando:

```shell
>>> exit()
```

Caso queira executar python em um ambiente de contêiner, recomendamos a leitura dos artigos:

- [Gerenciando Projetos com Git](http://www.jppreti.com/2019/08/28/gerenciando-projetos-com-git/);
- [Gerenciando o Ambiente de Desenvolvimento com Docker](http://www.jppreti.com/2020/02/02/desenvolvimento-com-docker/).

No ambiente de container recomendamos o uso dos editores **ipython** ou **Visual Studio Code** com os plugins **Docker** e **Remote Container**.

Para o `ipython` recomendamos executá-lo com o comando:

```shell
PYTHONIOENCODING=UTF-8 ipython3
```

para que a acentuação apareça corretamente.

Recomendamos também o uso de alguma ferramenta de lint, como `pylint` para verificar a corretude da sintaxe e receber sugestões de melhoria do código.

Caso tenha o pylint instalado basta executar o comando:

```shell
pylint ola_mundo.py
```

O programa irá sugerir correções no código e também atribuirá uma nota ao final do relatório.

# 2. Variáveis

Ao contrário de outras linguagens de programação, Python não tem um comando para declaração de variável. Uma variável é criada a partir do momento em que você associa um valor a ela.

```python
valor = 5 # valor é do tipo int
nome = 'João' # nome é do tipo str (pode-se usar ' ou ")
print(valor)
print(nome)
```

## 2.1. Variáveis Globais

São variáveis criadas fora de funções e portanto visíveis por qualquer função no seu código:

```python
nome = 'João'
def diga_ola():
    print('Olá ' + nome)
diga_ola()
```

Se você criar uma variável local (dentro da função) ela será visível apenas dentro da função:

```python
nome = 'João'
def diga_ola():
    nome = 'Maria'
    print('Olá ' + nome)
diga_ola()
print('Olá ' + nome)
```

# 3. Tipos de Dados

Os tipos de dados padrão podem ser enquadrados nas seguintes categorias:

- `Texto: str`
- `Numérico: int, float, complex`
- `Sequenciais: list, tuple, range`
- `Mapeamento: dict`
- `Conjunto: set, frozenset`
- `Lógico: bool`
- `Binário: bytes, bytearray, memoryview`

Para descobrir o tipo utilize o comando `type`:

```python
valor = 5
print(type(valor))
```

## 3.1. Exemplos

| **Código**                          | **Tipo**   |
| ----------------------------------- | ---------- |
| x = “Olá Mundo”                     | str        |
| x = 20                              | int        |
| x = 20.5                            | float      |
| x = 1j                              | complex    |
| x = [1,2,3]                         | list       |
| x = (1,2,3)                         | tuple      |
| x = range(6)                        | range      |
| x = {“nome” : “João”, “idade” : 40} | dict       |
| x = {1,2,3}                         | set        |
| x = frozenset({1,2,3})              | frozenset  |
| x = True                            | bool       |
| x = b”Olá”                          | bytes      |
| x = bytearray(5)                    | bytearray  |
| x = memoryview(bytes(5))            | memoryview |

## 3.2. Conversão de Tipos

```python
x = 1
y = 7.7
a = float(x)
b = int(y)
c = str(a)
print(a)
print(b)
print(c)
print(type(a))
print(type(b))
print(type(c))
```

## 3.3. Números Aleatórios

Para geração de números aleatórios faz-se necessário importar o módulo `random`:

```python
import random
print(random.randrange(1,10))
```

## 3.4. Entrada de Dados

Para solicitar ao usuário a entrada de dados utilize o comando `input`:

```python
nome = input('Digite seu nome: ')
print(nome)
```

## 3.5. String são Vetores

Strings em Python são arrays de bytes representando caracteres Unicode. Contudo, não existe o tipo caractere na linguagem.

O colchete `[]` pode ser utilizado para acessar os caracteres da string:

```python
nome = ' João Paulo '
print(len(nome)) #tamanho da string
nome = nome.strip() #remove os espaços em branco nas extremidades
print(len(nome))
print(nome[1]) #o primeiro caractere é o de posição 0
print(nome[2:4]) #de 2 a 3 (último não incluso)
print(nome[-5:-1]) #começa a contagem pelo final da string
print(nome.lower()) #transforma em minúsculo
print(nome.upper()) #transforma em maiúsculo
print(nome.replace('o','0')) #substitui a string
print(nome.split(' ')) #returns ["João","Paulo"]
print('au' in nome)) #retorna True se existe na string
print('au' not in nome)) #retorna True se não existe na string
idade = 40
texto = 'Meu nome é {} e tenho {} anos.'
print(texto.format(nome,idade))
```

# 4. Operadores

## 4.1. Aritméticos

| **Operador** | **Nome**                     | **Exemplo** |
| ------------ | ---------------------------- | ----------- |
| +            | Adição                       | x + y       |
| –            | Subtração                    | x – y       |
| *            | Multiplicação                | x * y       |
| /            | Divisão                      | x / y       |
| %            | Módulo                       | x % y       |
| **           | Exponenciação                | x ** y      |
| //           | Resultado inteiro da divisão | x //y       |

## 4.2. Comparativos

| **Operador** | **Nome**       | **Exemplo** |
| ------------ | -------------- | ----------- |
| ==           | Igual          | x == y      |
| !=           | Diferente      | x != y      |
| >            | Maior do que   | x > y       |
| <            | Menor do que   | x < y       |
| >=           | Maior ou igual | x >= y      |
| <=           | Menor ou igual | x <= y      |

## 4.3. Lógicos

| **Operador** | **Descrição**                                       | **Exemplo**        |
| ------------ | --------------------------------------------------- | ------------------ |
| and          | Retorna True se as duas condições forem verdadeiras | (x<5 and y<10)     |
| or           | Retorna True se uma das condições for verdadeira    | x<5 or y<10        |
| not          | Inverte o resultado lógico                          | not (x<5 and y<10) |

## 4.4. Pertinência

| **Operador** | **Descrição**                   | **Exemplo** |
| ------------ | ------------------------------- | ----------- |
| in           | Retorna True se x está em y     | x in y      |
| not in       | Retorna True se x não está em y | x not in y  |

## 4.5. Bit

| **Operador** | **Nome**             | **Descrição**                                          |
| ------------ | -------------------- | ------------------------------------------------------ |
| &            | E                    | Define como bit 1 apenas se os dois bits forem 1       |
| \|           | Ou                   | Define como bit 1 se pelo menos um dos dois bits for 1 |
| ^            | Ou Exclusivo         | Define como bit 1 se apenas um dos dois bits for 1     |
| ~            | Não                  | Inverte todos os bits                                  |
| <<           | Zero fill left shift | Preenche com bit 0 a direita                           |
| >>           | Signed right shift   | repete o bit mais a esquerda, descartando o da direita |

# 5. Estrutura de Condição

```python
nota = 7
if nota >= 7:
    print('Aprovado')
elif nota >= 5:
    print('Recuperação')
else:
    print('Reprovado')
```

# 6. Laços de Repetição

## 6.1. While

```python
x = 0
while x < 10:
    if x == 7:
        break #interrompe a execução do laço
    x += 1
    if x == 3:
        continue #salta para a próxima iteração
    print(x)
else:
    print('Fim!') #nunca é executado, já que x nunca é >= 10
```

## 6.2. For

```python
usuarios = ['carolina','diogo','maria','pedro']
for u in usuarios:
    print(u)
for x in range(7): print(x) #vai de 0 a 6 com incremento de 1
for x in range(2,7): print(x) #vai de 2 a 6 com incremento de 1
for x in range(0,7,2): print(x) #vai de 0 a 6 com incremento de 2
```

# 7. Coleções

As coleções permitem armazenar múltiplos itens dentro de uma única unidade, podemos fazer analogia a uma variável multivalorada.

Há 4 tipos de coleções:

- `[]` List: estrutura ordenada, mutável e permite duplicidade;
- `()` Tuple: estrutura ordenada, imutável e permite duplicidade;
- `{}` Set: estrutura não ordenada, não indexada e não permite duplicidade;
- `{:}`Dictionary: estrutura não ordenada, mutável, indexada e não permite duplicidade.

## 7.1. List

Listas são coleções de objetos, segue a idéia de um vetor em outras linguagens. Uma lista pode conter quaisquer valores, inclusive tipos mistos (inteiros, strings, datas, …) e até mesmo outras listas dentro dela.

```python
lista = [12.3, 'Maria', 4, ['a','b','c']]
```

Podemos também criar uma lista a partir da função `list()`:

```python
lista = list('João Paulo')
lista
['J','o','ã','o',' ','P','a','u','l','o']
```

Para adicionarmos elementos na lista podemos utilizar:

- `append()`: adiciona um único elemento na lista;
- `extend([,])`: adiciona vários elementos de uma única vez;
- `insert(pos,elem)`: adiciona em uma posição específica.

Exemplos:

```python
lista = [0,1] # cria uma lista com dois elementos (0 e 1)
lista = lista * 2 # repete o valor da lista duas vezes
lista += [2,3] # adiciona os valores 2 e 3 ao final da lista
lista.append(4) # adiciona o valor 4 ao final da lista
lista.extend([5,6,7]) # adiciona 3 elementos ao final da lista
lista.insert(0,-1) # adiciona o valor -1 na posição 0
```

Outras funções importantes de `List`:

- `clear()`: remove todos os itens na lista;
- `copy()`: faz uma cópia dos valores da lista;
- `count(valor)`: retorna quantas vezes o valor informado ocorre na lista;
- `index(valor)`: retorna a posição na lista em que foi encontrado o valor;
- `pop(index)`: remove e retorna o item localizado na posição informada;
- `remove(valor)`: remove a primeira ocorrência do valor informado;
- `reverse()`: inverte a ordem da lista;
- `sort()`: ordena a lista.

## 7.2. Tuple

Tuplas também são coleções de objetos e segue a mesma lógica das listas, a diferença é que tuplas são imutáveis e por isso não podem sofrer alterações após sua criação.

Apesar de não podermos utilizar funções que alteram o conteúdo de uma tupla, podemos inserir listas dentro de tuplas e alterar as listas:

```python
tupla = (0,1,2,3,[4,5,6])
tupla[4].remove(5)
```

## 7.3. Set

Um conjunto também é uma coleção de elementos, mas diferente de listas e tuplas, `set` é uma estrutura **não ordenada** e que **não permite** elementos em **duplicidade**.

```python
a = {0,1,2,3,4,5,6}
b = {4,5,6,7,8,9}
a - b # diferença entre conjuntos
a | b # união
a & b # intersecção
a ^ b # diferença simétrica
```

## 7.4. Dictionary

`List`, `tuple`, `range` e `str` são sequências ordenadas e `sets` são coleções de elementos não ordenados. O **Dicionário** é mais uma estrutura de dados **não ordenada**. A principal diferença é que podemos acessar seus elementos através de chaves e não de sua posição.

```python
clientes = {
    '000.000.000-00':'João Paulo',
    '111.111.111-11':'Maria',
    '222.222.222-22':'Pedro',
    '123.456.789-00':'Claudia'
}
print(clientes['222.222.222-22'])
```

# 8. Arquivo

Para abrir um arquivo, o Python possui a função `open()`. Ela recebe dois parâmetros: o primeiro é o nome do arquivo a ser aberto e o segundo é o modo que queremos trabalhar com esse arquivo – se queremos ler ou escrever. O modo é passado através de uma string: `"w"` (write) para escrita, `"r"` (read) para leitura e `"a"` (append) para escrita em arquivo já existente.

Vejamos abaixo exemplo de criação e depois leitura de um arquivo texto:

```python
arquivo = open('usuarios.txt','a') # abre o arquivo para escrita
arquivo.write('joao.preti@gmail.com\n') # escreve no arquivo
arquivo.write('maria@gmail.com\n') # escreve no arquivo
arquivo.close() # fecha o arquivo
...
arquivo = open('usuarios.txt','r') # abre o arquivo para leitura
for linha in arquivo:
    print(linha.strip()) # imprime a linha retirando o \n
arquivo.close() # fecha o arquivo
```

Como boa prática de programação recomendamos utilizar o comando `with` para navegar no arquivo, visto que este garante que o arquivo será fechado automaticamente ao final do escopo:

```python
with open('usuarios.txt') as arquivo:
    for linha in arquivo:
        print(linha.strip())
```

`close()` não é mais necessário

# 9. Exemplos

[Cadastro de Usuário com Lista e Arquivo](https://drive.google.com/open?id=1aG9Pt8x5sn7t1JMYOBsIqdSxhUy9mC16)
