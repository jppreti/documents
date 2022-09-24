# Visualizando arquivos binários

Todos os arquivos em computadores são armazenados em formato binário (1's e 0's). Imagens, texto, áudio, programas, etc.

A única diferença é que eles são interpretados de forma diferente dependendo do aplicativo que realiza a leitura.

Quando você visualiza um arquivo de texto usando `cat`, o programa lê todos os bits e os apresenta a você convertendo-os em caracteres do alfabeto ou idioma relevante.

Quando você visualiza um arquivo usando um visualizador de imagens, ele pega todos os bits e os transforma em uma imagem.

As ferramentas a seguir permitem visualizar esses arquivos de maneiras diferentes, como octal, hexadecimal ou mesmo binário.

Para hexadecimal:

```bash
hexdump -C arquivo
```

ou

```bash
xxd arquivo
```

ou

```bash
vim arquivo
:% !xxd
```

Se quiser ver no formato binário:

```bash
xxd -b arquivo
```

Octal:

```bash
od arquivo
```

A leitura é muito difícil, se você quiser entender o que um arquivo binário executável faz, é melhor visualizá-lo de uma maneira que mostre a linguagem assembly:

```bash
objdump -d arquivo_executável
```

O `objdump` é um disassembler, ele lê o conteúdo binário e converte seu conteúdo de volta para a linguagem de montagem.

O comando `strings` do Linux imprime as strings de caracteres imprimíveis do arquivo, o que pode facilitar a leitura:

```bash
strings arquivo
```

Se quiser editar o arquivo você pode usar:

```bash
bvi arquivo
```

Ou a extensão Hex Editor do VSCode. Selecione o arquivo binário, pressione `CTRL+E` e digite `> Hex Editor: Open` .
