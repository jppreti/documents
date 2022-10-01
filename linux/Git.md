## Apresentação

## Ferramenta Visual

Existe uma ferramenta visual localizada em [http://git-school.github.io/visualizing-git/](http://git-school.github.io/visualizing-git/#free) para que você possa entender o impacto dos comandos Git em um repositório simulado.

![Visual Git](https://github.com/jppreti/documents/blob/main/linux/images/GitVisual.png?raw=true)

## Introdução

Git é um sistema de controle de versões distribuído (SCM), usado principalmente no desenvolvimento de software, mas pode ser usado para registrar o histórico de edições de qualquer tipo de arquivo.

Neste post vamos apenas tratar rapidamente dos comandos básicos e necessários para utilização do Git em nossos projetos.

Aconselho a leitura da documentação Git em https://git-scm.com/book/pt-br/v1/Primeiros-passos para um estudo mais completo.

[Slides de apresentação](https://docs.google.com/presentation/d/1dj4BR7g0yfm1UVeC1n0bvo5QZCWNtWc9hexMhhpyztk/edit?usp=sharing) podem ser acessados [aqui](https://docs.google.com/presentation/d/1dj4BR7g0yfm1UVeC1n0bvo5QZCWNtWc9hexMhhpyztk/edit?usp=sharing).

## 1º Passo: Baixando e Instalando o Git

Acesse o endereço [Git - Downloads](https://git-scm.com/downloads), baixe e instale para a sua plataforma.

## 2º Passo: Criando um projeto no servidor

Vamos utilizar um servidor Git muito conhecido e gratuito o [GitHub](https://github.com/).

Acesse o site e crie uma conta para você.

Perceba que por padrão o GitHub fornece um projeto padrão chamado “*hello-world*“, mas vamos criar o nosso próprio projeto. Clique em **New** para isso.

Você perceberá as seguintes opções de preenchimento:

- **Repository name**: nome do seu repositório ou o nome do seu projeto;
- **Description**: um texto explicando que projeto é esse;
- **Public** ou **Private**: projetos públicos são gratuitos mas qualquer pessoa na internet pode visualizar o seu código fonte. Projetos privados impedem que outros tenham conhecimento do que você está desenvolvendo;
- **Initialize this repository with a README**: questiona se você quer que ele crie um arquivo texto intitulado README para que você possa descrever sobre como compilar, executar ou utilizar o seu projeto. É uma boa prática;
- **Add .gitignore**: cria um arquivo .gitignore que contêm todas as extensões que não serão aceitas no seu repositório. É uma boa prática impedir que códigos temporários ou códigos objeto não sejam versionados ou controlados pelo repositório;
- **Add a license**: você pode especificar que o seu projeto possui algum tipo de licença.

Preencha o formulário de acordo com as recomendações abaixo:

- **Repository name**: EstruturaDados
- **Description**: Projeto com todos os códigos desenvolvidos na disciplina de Estrutura de Dados
- **Public ou Private**: Public
- **Initialize this repository with a README**: Selecionado
- **Add .gitignore**: C
- **Add a license**: None

Crie o repositório. Perceba que haverá uma parte na interface que apresenta o endereço do seu repositório/projeto no botão **Clone or download**. Conforme figura abaixo:

![Clonando Repositório](https://github.com/jppreti/documents/blob/main/linux/images/GitCloneDownload.png?raw=true)

Aonde encontrar o endereço (URL) do projeto

Copie toda a URL para que possamos criar um clone desse repositório em nossa estação de trabalho.

## 3º Passo: Clonando o Projeto para a Máquina Local

Abra o **terminal** ou **prompt de comando** e crie um diretório para armazenar todos os nossos projetos Git.

```bash
mkdir git
cd git
```

Agora podemos clonar um projeto git por meio do comando:

```bash
git clone https://www....
```

Perceba que dentro do diretório git foi criado um diretório EstruturaDados. Esse diretório **EstruturaDados** é o diretório onde poderemos colocar todos os arquivos do nosso projeto.

```bash
ls -l
```

Vamos entrar no diretório EstruturaDados e verificar quais arquivos estão presentes.

```bash
cd EstruturaDados
ls -l
```

Veja que nosso arquivo README está presente.

Agora você pode copiar os arquivos ou começar a criar os arquivos do seu programa dentro do diretório EstruturaDados. Esses arquivos não são automaticamente adicionados ao repositório git, para isso é preciso que você informe ao Git que deseja controlar as versões desse arquivo.

## 4º Passo: Comandos Básicos

Crie um arquivo **main.c** dentro do diretório **EstruturaDados**. Agora você pode executar o comando abaixo para adicioná-lo ao repositório:

```bash
git add main.c
```

Quando quiser salvar uma versão do projeto como um todo no seu repositório local basta executar o seguinte comando:

```bash
git commit -m "Adicionado arquivo principal main.c do programa"
```

Veja que devemos informar uma mensagem descrevendo o que foi realizado nessa versão. Mas **atenção**, essa versão está apenas no seu **repositório local**, para enviar essa versão para o servidor você deverá executar o comando:

```bash
git push
```

Esse comando envia sua nova versão para o **repositório remoto**, atualize a página do GitHub e veja se não aparece o arquivo **main.c**.

Sempre que você quiser atualizar o repositório local com alterações que estejam no repositório remoto, basta utilizar o comando:

```bash
git pull
```

Isso será necessário quando você estiver trabalhando em equipe (mais de uma pessoa atualizando o repositório) ou quando você tiver mais de uma estação de trabalho (mais de um clone).

Uma boa prática de programação é não ficar trabalhando com a versão principal (master) do seu repositório. A versão principal (master) deve conter um código estável e sem erros de compilação ou execução.

Para não afetar a versão principal do repositório é sempre bom criar um **branch** (**ramo**). Por exemplo, os comandos abaixo criam um branch chamado *novafuncionalidade*.

```bash
git branch novafuncionalidade
git checkout novafuncionalidade
```

Pronto, a partir de agora você pode realizar *commit*s sem afetar a branch **master**.

Quando seu código estiver pronto e testado na branch *novafuncionalidade*, você pode voltar para a branch *master* e mesclar as alterações feitas e testadas da branch *novafuncionalidade*.

```bash
git checkout master
git merge novafuncionalidade
```

Feita a mesclagem podemos apagar a branch *novafuncionalidade*:

```bash
git branch -d novafuncionalidade
```

Caso ocorra algum conflito ao realizar o *merge* ou quando tentar atualizar o repositório, você pode verificar quais são os arquivos conflitantes com o comando:

```bash
git status
```

Basta que você edite o(s) arquivo(s) conflitante(s) resolvendo os conflitos e os marque como resolvidos por meio do comando:

```bash
git add arquivo_conflitante
```

Agora você pode realizar novamente o *commit* que deverá ocorrer com sucesso.

Caso você tenha feito algo localmente, se arrependeu e tem CERTEZA que quer descartar as modificações locais, basta executar o comando:

```bash
git reset --hard origin/master
```

Mas cuidado, todas as modificações que você realizou serão descartadas definitivamente.

Existem diversas características para serem conhecidas sobre Git e por isso recomendamos fortemente a leitura da documentação em [Git - Book](https://git-scm.com/book/pt-br/v2).
