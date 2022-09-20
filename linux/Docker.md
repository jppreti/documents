# Introdução

O Docker é uma alternativa de virtualização em que o kernel da máquina hospedeira é compartilhado com a máquina virtualizada ou o software em operação.

Portanto, um desenvolvedor pode agregar a seu software a possibilidade de levar as bibliotecas e outras dependências do seu programa com menos perda de desempenho do que a virtualização do hardware de um servidor completo.

Sendo assim, temos uma ferramenta que permite empacotar um aplicativo e suas dependências em um recipiente virtual que pode ser executado em qualquer servidor Linux.

# Imagem vs Contêiner

**Contêiner** é a instância de uma **imagem**, assim como um objeto é uma instância de uma classe na orientação a objetos. Uma imagem empacota a aplicação e o ambiente necessário para sua execução, sendo o contêiner uma instância em execução dessa imagem.

Isso significa que podemos ter **vários contêineres** (várias instâncias) em execução de uma mesma imagem.

## Imagem

No docker uma **imagem** é um arquivo **imutável** (não pode ser modificado) que contêm o código fonte ou executável, bibliotecas, dependências, ferramentas e outros arquivos necessários para a execução da aplicação.

Devido as características de somente leitura, as **imagens** podem ser referenciadas como **snapshots**. Representam uma aplicação e seu ambiente em um ponto específico do tempo. Essa consistência é um dos pontos fortes do Docker, o que permite desenvolvedores testar e experimentar o software de forma estável e em condições uniformes.

Já que as **imagens** são de certa forma **templates** para construir um contêiner, você não pode executá-las. O que você pode fazer é usar esse template (imagem) como base para criar o contêiner. Assim que o contêiner é criado é adicionada automaticamente uma camada que permite a escrita no contêiner, permitindo que você o modifique.

## Contêiner

Um **contêiner** no Docker é um ambiente de execução virtualizado aonde usuários podem isolar aplicações do sistema de base. Os contêineres são compactos, unidades portáveis que você pode executar de forma fácil e rápida.

Uma característica importante é a padronização do ambiente computacional dentro do **contêiner**. Isso assegura que a sua aplicação está sendo executada em circunstâncias idênticas, mas também facilita o compartilhamento com outros membros da equipe.

Os contêineres são **autônomos**, provêm forte **isolamento**, garantem que não irão interromper outros contêineres em execução, assim como o servidor aonde estão sendo executados.

## Dockerfile

É o arquivo que contêm o script para construção da imagem.

# Baixando e Instalando o Docker

[Developers - Docker](https://www.docker.com/get-started)

A instalação é simples, sem mistérios de configuração durante o processo.

Importante dizer que por padrão o docker não pode ser instalado no Windows Home, sendo necessário o Windows Pro, porque o Windows 10 Home não suporta o recurso de Hyper-V.

Mas o usuário Windows 10 Home pode tentar utilizar a virtualização VirtualBox ao invés Hyper-V acessando a BIOS do computador e ativando esse recurso.

Acesse o Gerenciador de Tarefas (Task Manager) e verifique se a virtualização está habilitada.

Caso não obtenha sucesso na instalação do Docker Desktop, tente instalar o Docker Toolbox disponibilizado para versões mais antigas do Windows e do Mac OS. Vide [Docker Desktop | Docker Documentation](https://docs.docker.com/toolbox/toolbox_install_windows/) .

# Comandos Básicos

Para conhecer os parâmetros aceitos pelo comando `docker` execute:

```docker
docker --help
```

Primeiro vamos verificar quais são as imagens presentes na sua máquina:

```docker
docker images
```

Provavelmente não haverá imagem alguma e portanto não podemos construir e executar um contêiner.

Para descobrir imagens disponíveis na Internet você pode acessar o endereço [https://hub.docker.com/](https://hub.docker.com/) ou buscar por meio do comando `docker search`:

```docker
docker search ubuntu
```

Deve retornar uma lista de imagens que atendem o critério de busca. A lista é apresentada por ordem das imagens mais baixadas primeiro e que são consideradas oficiais.

Agora que sabemos que temos imagens disponíveis do ubuntu para utilizar, podemos baixar a imagem e criar um contêiner a partir dessa imagem por meio do comando:

```docker
docker run --name cont-ubuntu -it ubuntu:latest /bin/bash
```

Vamos entender o que ocorreu:

- Baixa a imagem `ubuntu:latest` do registry;
- Cria um novo contêiner com o nome `cont-ubuntu`;
- Aloca um sistema de arquivos e monta uma camada de leitura e escrita;
- Aloca uma interface de network/bridge;
- Configura um endereço IP;
- Executa o processo especificado `/bin/bash`;
- Captura e fornece uma saída para a aplicação.

Agora que você está com o terminal ativo interagindo com o contêiner `cont-ubuntu`, você tem duas opções para sair:

- `CTRL + D`: sai encerrando o contêiner;
- `CTRL + P + Q`: sai mantendo o contêiner ativo;

Para saber quais são os contêineres em execução basta executar o comando:

```docker
docker ps
```

Para retornar ao contêiner que está em execução basta utilizar o parâmetro `attach`:

```docker
docker attach cont-ubuntu
```

Caso queira parar um contêiner que está em execução você pode utilizar o parâmetro `stop`:

```docker
docker stop cont-ubuntu
```

Para visualizar todos os contêineres (em execução ou parados) utilize o comando:

```docker
docker ps -a
```

Quando desejar torná-lo ativo novamente utilize o parâmetro `start`:

```docker
docker start cont-ubuntu
```

Caso deseje executar um comando no contêiner estando fora dele, basta usar o parâmetro `exec`:

```docker
docker exec cont-ubuntu apt upgrade
```

Se quiser saber o que mudou na estrutura do contêiner desde sua criação, utilize o parâmetro `diff`:

```docker
docker diff cont-ubuntu
```

Quando não precisar mais e quiser **excluir um contêiner** utilize o comando:

```docker
docker rm cont-ubuntu
```

Caso queira também **excluir a imagem**:

```docker
docker rmi ubuntu
```

# Criando Novas Imagens

Se você realizar modificações no contêiner e quiser salvar em uma nova imagem para futuras instâncias é possível fazê-lo tirando um *snapshot* do estado atual do contêiner. Fazendo isso você está adicionando uma nova camada no topo da imagem original, criando uma nova imagem imutável. Como resultado você terá duas imagens derivadas do mesmo sistema de arquivos.

Essa é uma forma de construir um contêiner aproveitando as configurações feitas anteriormente ou até mesmo porque deseja compartilhá-la com outras pessoas.

Tecnicamente essa realização é feita por meio do comando `docker commit`:

`docker commit CONTAINER_ID NAME:VERSION`

Exemplo:

```docker
docker commit cont-ubuntu jppreti/ubuntu:latest
```

Caso queira compartilhar essa nova imagem com outras pessoas ou apenas salvá-la no docker hub (registry) faça o login e depois envie a imagem:

```docker
docker login
docker push jppreti/ubuntu:latest
```

As imagens publicadas podem ser visualizadas na sua conta cadastrada no hub, no meu caso estão disponíveis no endereço [Docker Hub](https://hub.docker.com/u/jppreti).

Caso você tenha criado a imagem sem utilizar seu nome de usuário do docker hub e queira modificar o nome da imagem faça:

```docker
docker tag ubuntu jppreti/ubuntu:latest
```

É possível também exportar a imagem para um arquivo:

```docker
docker save jppreti/ubuntu:latest > ubuntu.tar
```

Para restaurá-lo em outro local:

```docker
docker load --input ubuntu.tar
```

# Baixando e Executando uma imagem do MySQL

Primeiro vamos baixar a imagem que contêm o serviço do mysql na sua versão mais atualizada disponível:

```dockker
docker pull mysql/mysql-server:latest
```

Você pode utilizar o comando `docker images` para visualizar se a imagem está disponível localmente.

Para criar um contêiner a partir da imagem do mysql podemos utilizar o comando abaixo:

```docker
docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -e MYSQL_DATABASE=dbteste -e MYSQL_USER=jppreti -e MYSQL_PASSWORD=123456 --name mysql-dbteste mysql/mysql-server:latest
```

Abaixo detalho cada parâmetro do comando de execução (`docker run`):

`docker run -d` #-d detach mode (segundo plano)

`-p 3306:3306` #porta que será exposta para a rede

`-e MYSQL_ROOT_PASSWORD=123456` #senha do usuário root do mysql

`-e MYSQL_DATABASE=dbteste` #nome do banco de dados a ser criado

`-e MYSQL_USER=jppreti` #será criado um usuário jppreti

`-e MYSQL_PASSWORD=123456` #senha do usuário jppreti

`--name mysql-dbteste` #nome do contêiner em execução

`mysql/mysql-server:latest` #imagem de referência a ser utilizada

Na verdade o comando `docker pull` não é obrigatório, visto que o comando `docker run` realiza o *pull* automaticamente caso não encontre a imagem localmente.

Agora podemos abrir um terminal do contêiner do MySQL para interagirmos com o banco:

```docker
docker exec -it mysql-dbteste /bin/bash

mysql -u root -p
```

Execute o comando abaixo para visaulizar os bancos de dados existentes e perceba o nosso banco `dbteste`:

```shell
show databases;
```

# Criando um Volume

Todas as modificações (criação, alteração ou exclusão) de arquivos realizadas no contêiner são perdidas quando o contêiner é destruído. Caso deseje persistir as alterações e ter acesso a elas toda vez que o contêiner for criado, devemos utilizar o **volume**.

Os volumes são áreas de dados persistentes, normalmente diretórios do sistema de arquivos do host ou de um *storage* disponibilizados para um contêiner.

Ao contrário dos sistemas de arquivos dos contêineres, volumes não sofrem overheads de escrita e também não são perdidos (a menos que se utilize o parâmetro -v na remoção do contêiner) com a exclusão/criação de contêineres, pois o acesso ao sistema de arquivos do volume é direto.

Existem 3 tipos de montagem de volumes que podem ser utilizados:

- **Bind**: utiliza-se uma pasta presente no host que será montada em um alvo específico dentro do contêiner. Simplista, esse modo de montagem é muitas vezes utilizado para facilitar o acesso aos arquivos do volume;
- **Volume**: Comumente referido como Named Volume, utiliza-se a infraestrutura de volume do docker, que pode tanto utilizar drivers locais para servir o espaço para o contêiner, quanto utilizar plugins que permitem fazer a integração com outros serviços como o Amazon S3, Minio, CEPH, etc;
- **TmpFS**: Análogo ao tmpfs de sistemas posix, permite reservar uma área de memória para montagem em um contêiner, sendo útil para dados que possuem um alto nível de mutabilidade mas que não precisam persistir em caso de remoção do contêiner.

Vamos apresentar como criar um volume para que os dados do MySQL sejam mantidos, mesmo com a destruição do contêiner.

O primeiro passo é a criação do volume:

```docker
docker volume create vol-mysql-db
```

Para saber quais são os volumes existentes no host basta fazer:

```docker
docker volume ls
```

Agora quando formos criar um contêiner MySQL devemos adicionar o parâmetro `-v` indicando o **nome do volume** e a **pasta no contêiner** que ele irá persistir:

```docker
docker run ... -v vol-mysql-db:/var/lib/mysql ...
```

Quando quiser realizar um backup do banco de dados basta utilizar o próprio utilitário `mysqldump`:

```docker
docker exec mysql-dbteste /usr/bin/mysqldump -u root --password=123456 dbteste > dbteste-bkp.sql
```

Para restaurar um backup do banco podemos fazer:

```docker
cat dbteste-bkp.sql | docker exec -i mysql-dbteste /usr/bin/mysql -u root --password=123456 dbteste
```

# Interligando Contêineres

Até o momento temos lidado apenas com a existência de um único contêiner, mas na realidade é comum em projetos de software a existência de mais de um para atender os diversos serviços necessários da aplicação.

Por exemplo, podemos ter um contêiner para o banco de dados e outro para a aplicação (um servidor web por exemplo).

Isso quer dizer que haverá a necessidade de contêineres, que são naturalmente isolados, se comunicarem. Essa comunicação pode ocorrer por meio da **liberação de portas** ou por meio de **links**, sendo este último o mais indicado por questões práticas e de segurança.

Um **link** permite interligar contêineres de forma segura e sem a necessidade de expor para a rede uma interface de comunicação.

O **link** permite que você trafegue informações entre os contêineres de forma segura, pois quem conhece um contêiner conhece apenas o seu **par** definido no link. Quando você configurar um link, você cria um elo de ligação entre um contêiner de origem e um contêiner de destino. Para criar um link, você deve utilizar o parâmetro `–-link`. Em primeiro lugar, deve-se criar um contêiner que será origem de dados para outro contêiner.

Como já temos nosso contêiner do banco de dados MySQL podemos partir diretamente para a construção do contêiner do servidor web:

```docker
docker run -d -P --name web --link mysql-dbteste:mysql-dbteste tomcat
```

Dessa forma, temos um **contêiner** chamado `web` que foi construído a partir de uma **imagem** do `tomcat` que está ligado ao **contêiner** `mysql-dbteste`. Qualquer referência a `localhost` dentro do contêiner `web` irá visualizar os serviços que estão em execução no contêiner `mysql-dbteste`, passando a impressão que são um único contêiner.

# IDEs

Com relação as IDEs muitas já possuem suporte a Docker, facilitando o desenvolvimento de aplicações utilizando contêineres. Abaixo deixo três tutoriais que mostram como utilizar IDEs para o desenvolvimento de aplicações integradas com Docker.

Para configurar o **Visual Studio Code** siga o tutorial abaixo:

[Developing inside a Container using Visual Studio Code Remote Development](https://code.visualstudio.com/docs/remote/containers)

Para configurar o **PyCharm** para rodar projetos em python em um contêiner docker compatível siga o tutorial abaixo:

[Configure an interpreter using Docker | PyCharm](https://www.jetbrains.com/help/pycharm/using-docker-as-a-remote-interpreter.html)

Para configurar o **IntelliJ** para rodar projetos em Java em um contêiner docker compatível siga o tutorial abaixo:

[Run a Java application in a Docker container | IntelliJ IDEA](https://www.jetbrains.com/help/idea/running-a-java-app-in-a-container.html)## Introdução

O Docker é uma alternativa de virtualização em que o kernel da máquina hospedeira é compartilhado com a máquina virtualizada ou o software em operação.

Portanto, um desenvolvedor pode agregar a seu software a possibilidade de levar as bibliotecas e outras dependências do seu programa com menos perda de desempenho do que a virtualização do hardware de um servidor completo.

Sendo assim, temos uma ferramenta que permite empacotar um aplicativo e suas dependências em um recipiente virtual que pode ser executado em qualquer servidor Linux.
