
# Curso Básico de Shell Script

## Sumário
1. [Introdução ao Shell Script](#introdução-ao-shell-script)
2. [Primeiro Script](#primeiro-script)
3. [Comentários em Shell Script](#comentários-em-shell-script)
4. [Variáveis](#variáveis)
5. [Operadores](#operadores)
6. [Estruturas Condicionais](#estruturas-condicionais)
7. [Laços de Repetição](#laços-de-repetição)
8. [Funções](#funções)
9. [Entrada e Saída](#entrada-e-saída)
10. [Manipulação de Arquivos](#manipulação-de-arquivos)
11. [Depuração de Scripts](#depuração-de-scripts)

---

## Introdução ao Shell Script

O **Shell Script** é uma linguagem de script usada para automatizar tarefas no sistema operacional. É muito comum em sistemas baseados em UNIX, como o Linux. Um shell script é um arquivo de texto que contém comandos que podem ser executados no terminal.

### Principais Shells:
- `bash` (Bourne Again Shell)
- `sh` (Bourne Shell)
- `zsh` (Z Shell)
- `ksh` (Korn Shell)

Para verificar o shell em uso, você pode digitar no terminal:

```bash
echo $SHELL
```

---

## Primeiro Script

1. Crie um arquivo de texto com o nome `meu_script.sh`:
   
   ```bash
   touch meu_script.sh
   ```

2. Adicione permissões de execução ao arquivo:

   ```bash
   chmod +x meu_script.sh
   ```

3. Abra o arquivo em um editor de texto, como o `nano` ou `vim`, e adicione o seguinte código:

   ```bash
   #!/bin/bash
   echo "Olá, Mundo!"
   ```

4. Execute o script:

   ```bash
   ./meu_script.sh
   ```

   Você deverá ver a mensagem `Olá, Mundo!` no terminal.

---

## Comentários em Shell Script

Comentários são essenciais para tornar o código mais compreensível. Para adicionar um comentário em Shell Script, use o caractere `#`.

```bash
# Este é um comentário de uma linha

# O comando abaixo imprime uma mensagem na tela
echo "Este é um exemplo"
```

---

## Variáveis

Variáveis são utilizadas para armazenar valores. No Shell Script, não é necessário declarar o tipo da variável.

```bash
#!/bin/bash

nome="Maria"
idade=25

echo "Nome: $nome"
echo "Idade: $idade"
```

### Variáveis Especiais:
- `$0`: Nome do script.
- `$1, $2, ..., $N`: Argumentos passados para o script.
- `$#`: Quantidade de argumentos.
- `$?`: Código de retorno do último comando.

---

## Operadores

### Operadores Aritméticos:

```bash
a=5
b=3
soma=$((a + b))
echo "Soma: $soma"
```

### Operadores de Comparação:

- `-eq`: Igual a.
- `-ne`: Diferente de.
- `-gt`: Maior que.
- `-lt`: Menor que.
- `-ge`: Maior ou igual a.
- `-le`: Menor ou igual a.

Exemplo:

```bash
if [ $a -gt $b ]; then
    echo "$a é maior que $b"
fi
```

---

## Estruturas Condicionais

### `if...else`

```bash
#!/bin/bash

echo "Digite um número:"
read num

if [ $num -gt 10 ]; then
    echo "O número é maior que 10."
else
    echo "O número é menor ou igual a 10."
fi
```

### `case`

```bash
#!/bin/bash

echo "Escolha uma cor (vermelho, azul ou verde):"
read cor

case $cor in
    vermelho)
        echo "Você escolheu vermelho!"
        ;;
    azul)
        echo "Você escolheu azul!"
        ;;
    verde)
        echo "Você escolheu verde!"
        ;;
    *)
        echo "Cor desconhecida!"
        ;;
esac
```

---

## Laços de Repetição

### `for`

```bash
#!/bin/bash

for i in {1..5}; do
    echo "Contagem: $i"
done
```

### `while`

```bash
#!/bin/bash

contador=1

while [ $contador -le 5 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1))
done
```

---

## Funções

Funções permitem reutilizar código de forma mais organizada.

```bash
#!/bin/bash

minha_funcao() {
    echo "Esta é uma função"
}

minha_funcao
```

Funções também podem receber argumentos:

```bash
#!/bin/bash

soma() {
    resultado=$(( $1 + $2 ))
    echo "Resultado: $resultado"
}

soma 5 7
```

---

## Entrada e Saída

### Entrada de Dados (`read`)

```bash
#!/bin/bash

echo "Digite seu nome:"
read nome
echo "Olá, $nome!"
```

### Saída de Dados (`echo`)

O comando `echo` imprime mensagens no terminal:

```bash
echo "Mensagem a ser exibida"
```

### Redirecionamento de Saída:

- `>`: Sobrescreve o arquivo.
- `>>`: Acrescenta ao arquivo.

```bash
echo "Texto no arquivo" > arquivo.txt
echo "Novo texto" >> arquivo.txt
```

### Redirecionamento de Erro:

- `2>`: Redireciona erros.

```bash
comando_inexistente 2> erros.log
```

---

## Manipulação de Arquivos

### Listar Arquivos

```bash
ls -l
```

### Criar e Remover Arquivos

```bash
touch arquivo.txt  # Criar arquivo
rm arquivo.txt     # Remover arquivo
```

### Copiar e Mover Arquivos

```bash
cp arquivo.txt /caminho/destino/  # Copiar
mv arquivo.txt /caminho/destino/  # Mover
```

---

## Depuração de Scripts

Para depurar um script, você pode executar o script com a opção `-x`:

```bash
bash -x meu_script.sh
```

Isso mostrará a execução de cada comando e ajudará a identificar possíveis erros.

---

## Conclusão

Esse curso básico de Shell Script abordou os principais conceitos e comandos necessários para você começar a automatizar tarefas no Linux. Explore mais e experimente criar seus próprios scripts!
