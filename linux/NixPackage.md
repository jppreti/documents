# Nix

Este material foi traduzido e adaptado da documentação do NixOS.

## O que é um shell environment?

Um shell environment é um ambiente de terminal que lhe fornece exatamente as versões dos pacotes especificados pelo Nix.

Um exemplo de `hello world`:

```bash
$ hello
The program ‘hello’ is currently not installed.
$ nix-shell -p hello
[nix-shell:~]$ hello
Hello, world!
[nix-shell:~]$ exit
exit
$ hello
The program ‘hello’ is currently not installed.
```

Utilizamos o parâmetro `-p` (packages) para especificar que precisamos do pacote `hello`, é uma dependência para o nosso shell. Nix localizouu a dependência, fez o download e a tornou disponível para o ambiente.

## Quando shell environments são úteis?

Quando você **desejar utilizar uma ferramenta que você não tem instalada**. Você pode utilizar a ferramenta sem precisar "instalar" o software.

Se você quiser **testar uma ferramenta**.

Se você quiser **fornecer a outra pessoa uma única linha de comando para instalar um conjunto de ferramentas** que podem ser padronizadas em diversas máquinas Linux, Windows (WSL) ou MacOS.

Se desejar **fornecer um script que é reprodutível em diversos ambientes**.

## Localizando pacotes

Você pode disponibilizar no ambiente qualquer pacote que esteja na [lista de pacotes oficiais](https://nixos.org/nixos/packages.html).

Você pode fazer uma busca utilizando o comando abaixo:

```bash
$ nix-env -qaP git
gitAndTools.gitFull  git-2.25.0
gitMinimal           git-2.25.0
```

A primeira coluna é o nome do pacote e a segunda coluna descreve a versão.

## Ad hoc shell environments

Sabendo o nome dos pacotes, você pode iniciar um shell contendo várias ferramentas:

```bash
$ nix-shell -p gitMinimal vim nano joe
these paths will be fetched (44.16 MiB download, 236.37 MiB unpacked):
...
/nix/store/fsn35pc8njnimgn2sn26dlsyxya1wssb-vim-8.2.0013
/nix/store/wdqjszpr5dlys53d79fym6rv9vyyz29h-joe-4.6
/nix/store/hx63qkip16i4wifaqgxwrrmxj4az53h1-git-2.25.0

[nix-shell:~]$ git --version
git version 2.25.0

[nix-shell:~]$ which git
/nix/store/hx63qkip16i4wifaqgxwrrmxj4az53h1-git-2.25.0/bin/git
```

Perceba que mesmo que você tenha o Git já instalado em seu ambiente padrão de trabalho, dentro do Nix shell, somente as versões especificadas pelo Nix é que serão utilizadas.

Pressione `CTRL-D` para sair do shell, a partir daí os pacotes não estarão mais disponíveis.

## Não apenas ferramentas: Python libraries

`nix-shell` fornece diversas outras variáveis bash especificadas nos pacotes.

Vejamos um exemplo utilizando Python e `$PYTHONPATH`:

```bash
$ nix-shell -p 'python38.withPackages (packages: [ packages.django ])'
...
[nix-shell:~]$ python -c 'import django; print(django)'
<module 'django' from '/nix/store/c8ipxqsgh8xd6zmwb026lldsgr7hi315-python3-3.8.1-env/lib/python3.8/site-packages/django/__init__.py'>
```

Criamos um ambiente com `$PYTHONPATH` configurado e `python` disponível com o pacote `django`.

O parâmetro `-p` consegue tratar mais do que apenas o nome dos pacotes, é possível utilizar expressões Nix completas.

## Buscando a Reprodutibilidade

Se você repassar esses comandos básicos do Nix para outro desenvolvedor, é possível que os resultados sejam diferentes.

Apesar desses comandos serem **muito convenientes**, eles não **reproduzem perfeitamente** o ambiente apenas dessa forma.

Um ambiente só é perfeitamente reprodutível se os resultados forem os mesmos independente de **quando** ou em **que máquina** você executa o comando. O ambiente deve ser sempre o mesmo.

Nix permite a criação de ambientes perfeitamente reprodutíveis, chamados **pure environments**. Por exemplo:

```bash
$ nix-shell --pure -p git -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz

[nix-shell:~]$ git --version
git version 2.33.1
```

Duas coisas aconteceram nesse exemplo:

1. O parâmetro `--pure` garante que o ambiente em bash não seja uma variante (herdado) do seu sistema. Isso garante que apenas o `git` instalado pelo Nix estará disponível dentro do shell. Isso é muito útil para scripts que executam, por exemplo, em um ambiente de integração contínua (CI). Claro que para o ambiente de desenvolvimento normalmente ignoramos esse parâmetro porquê queremos ter acesso muitos outros recursos de nosso ambiente de trabalho.

2. O parâmetro `-I` garante que o Nixpkgs irá baixar a versão exata do pacote que é desejado, deixando sem dúvidas qual a versão do pacote que está sendo disponibilizado no ambiente.

## Executáveis reprodutíveis

Finalmente podemos construir um script envelopado (wrapped) com Nix para poder compartilhar o script em um repositório Git, por exemplo. Contanto que os desenvolvedores tenham Nix instalado, eles podem executar o script sem se preocupar em instalar as dependências e desinstalá-las após o término da execução do script.

```python
#! /usr/bin/env nix-shell
#! nix-shell --pure -i python -p "python38.withPackages (ps: [ ps.django ])"
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz

import django

print(django)
```

Basicamente é o mesmo exemplo já executado anteriormente, mas desta vez encapsulado em um script e versionado. Todos os comandos Nix necessários estão incluídos utilizando o cabeça~lho `#!` dentro do próprio script.

**Observação:**

O cabeçalho de múltiplas linhas é uma característica suportada pelo [nix-shell](https://nixos.org/manual/nix/stable/command-ref/nix-shell.html#use-as-a--interpreter). Todas as linhas `#! nix-shell` são utilizadas para configurar o ambiente e prepará-lo para executar o corpo do script.

# Configurando o ambiente de desenvolvimento

Uma forma prática de configurar um ambiente de desenvolvimento é por meio da criação de um arquivo de configuração Nix para o shell. Por convenção esse arquivo normalmente é chamado de `shell.nix`:

```nix
{ pkgs ? import <nixpkgs> {}
}:
pkgs.mkShell {
  name="dev-environment";
  buildInputs = [
    pkgs.gcc
    pkgs.gdb
    pkgs.cmake
    pkgs.git
    pkgs.micro
    pkgs.docker
    pkgs.bat
    pkgs.openvscode-server
  ];
  shellHook = ''
    echo "Start developing ..."
  '';
}
```

Basicamente configuramos o shell (`mkShell`), fornecemos uma identificação para esse ambiente (`dev-environment`), especificamos **8 pacotes** que devem estar disponíveis no ambiente para desenvolvimento em C/C++ e ao final definimos o que deve ser executado após o ambiente estar construído (`shellHook`), neste caso em particular apenas uma mensagem informando que já pode começar a desenvolver.

# Criando um pacote para sua aplicação

Vamos construir uma aplicação `Olá Mundo!` web em Python utilizando o framework Flask.

Primeiro criamos o arquivo `default.nix`. Este arquivo é uma convenção utilizada para espefcificar o empacotamento de uma aplicação:

```nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.python3Packages.buildPythonApplication {
  pname = "myapp";
  src = ./.;
  version = "0.1";
  propagatedBuildInputs = [ pkgs.python3Packages.flask ];
}
```

Vamos precisar agora criar nossa aplicação web que será empacotada `myapp.py`:

```python
#! /usr/bin/env python

from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, Nix!"

def run():
    app.run(host="0.0.0.0")

if __name__ == "__main__":
    run()
```

E um arquivo de configuração da aplicação `setup.py`:

```python
from setuptools import setup

setup(
    name='myapp',
    version='0.1',
    py_modules=['myapp'],
    entry_points={
        'console_scripts': ['myapp = myapp:run']
    },
)
```

Agora podemos construir o pacote por meio do comando:

```bash
nix-build
```

Essa ação irá criar um link simbólico `result` para o caminho do nosso pacote no repositório local do Nix, que se parece com `/nix/store/6i4l781jwk5vbia8as32637207kgkllj-myapp-0.1`.

Perceba que é possível executar a aplicação do pacote dessa forma: `./result/bin/myapp`. Também podemos utilizar o arquivo `default.nix` para construir um shell configurado com as dependências necessárias e obter o mesmo resultado:

```bash
nix-shell default.nix
python myapp.py
```

Nesse contexto, Nix assume um papel similar àquele que você obteria com `pip` ou `virtualenv`. Nix instala as dependências necessárias e as separa do seu ambiente padrão de trabalho.

Você pode compartilhar os arquivos Nix em um sistema de controle de versão e garantir que todos irão executar o mesmo software. Essa é uma forma de prevenir que as configurações não sejam diferentes entre diferentes desenvolvedores e colaboradores, especialmente quando um projeto possui muitas dependências.

Você pode também executar o script bash que segue para verificar que o arquivo `default.nix` continua funcionando em futuras atualizações.

```shell
#!/usr/bin/env nix-shell
#! nix-shell -i bash
set -euo pipefail

# start myapp in background and save the process id
python myapp.py >> /dev/null 2>&1 &
pid=$!

if [[ $(curl --retry 3 --retry-delay 1 --retry-connrefused http://127.0.0.1:5000) == "Hello, Nix!" ]]; then
    echo "SUCCESS: myapp.py is serving the expected string"
    kill $pid
    exit 0
else
    echo "FAIL: myapp.py is not serving the expected string"
    kill $pid
    exit 1
fi
```
