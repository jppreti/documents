# 1. Introdução

Os conceitos e exemplos abaixo tem por objetivo apresentar a ideia geral de como um *container* funciona. Os conceitos serão apresentados de forma superficial, mas serão suficientes para que você possa buscar em outras fontes uma explicação mais aprofundada sobre cada tópico.

# 2. Cgroups

Vamos começar falando dos grupos de controle (cgroups). Cgroups permitem alocar recursos — tais como tempo da CPU, memória do sistema, largura de banda de rede ou combinações destes recursos — entre grupos de usuários definidos de tarefas (processos) rodando em um sistema.

```shell
ls /sys/fs/cgroup
```

Todos os processos em execução são organizados em Cgroups:

```shell
systemctl status
```

## 2.1. Slice

O `systemd` é um sistema de inicialização, utilizado pela maioria das distribuições linux. Na prática, o systemd assume o controle assim que o kernel é ativado pelo gerenciador de *bootloader* (Grub, tipicamente). A partir daí, são carregados todos os dispositivos (placa de rede, processador gráfico etc.) e processos que se iniciam com o sistema — estes são identificados pelo PID (*process identifier*).

O recurso de *slice* do `systemd` permite agrupar processos relacionados (por exemplo, uma sessão de usuário ou um serviço de sistema composto por vários processos). Cada fatia (*slice*) pode ter o máximo de recursos de CPU e memória alocados para ela, o que pode impedir que uma única fatia cause um ataque de negação de serviço em outras fatias executando o sistema sem recursos. Também permite agrupar processos para que todos possam ser eliminados de uma vez, por exemplo, quando um usuário faz logout (isso não é ativado por padrão).

Criando um *slice*:

```shell
sudo vim /etc/systemd/system/jp.slice

[Slice]
CPUQuota=30%
```

Criar um `shell` dentro de um cgroup configurado com `jp.slice`:

```shell
systemd-run --slice=jp.slice --uid=jppreti --shell
```

## 2.2. Unshare

Perceba que apesar de estar "fatiado" o processo do `shell` não está isolado. Ao executar `ps aux` podemos ver todos os outros processos que estão em execução. Para isolar, precisamos usar o recurso de `unshare` que permite descompartilhar e isolar o processo (`--pid`).

```shell
sudo unshare --fork --pid --mount-proc /bin/bash
```

```shell
ps aux
```

Se listarmos o diretório `/proc`, só veremos os PIDs criados nesse `shell`:

```shell
ls /proc
```

Isso significa que esses processos ficam isolados dos outros processos. Inclusive se executar o commando `id`, veremos que nesse `shell` nosso usuário tem id `0`, sendo portanto o `root`:

Isso não é muito seguro, se executarmos o comando anterior com `--user` e verificarmos o `id`:

```shell
sudo unshare --fork --pid --mount-proc --user /bin/bash

id
```

Veremos que o id do usuário é o maior, sendo `nobody`.

Caso deseje utilizar outros privilégios, informe o id de usuário e grupo que deseja:

```shell
sudo unshare --fork --pid --mount-proc --setuid 1000 --setgid 1000 /bin/bash
```

# 3. Container

Um container é só um ambiente isolado e vamos fazer uma demonstração de como isso funciona. Vamos baixar uma mini distribuição linux, uma *userland*.

```shell
wget https://github.com/ericchiang/containers-from-scratch/releases/download/v0.1.0/rootfs.tar.gz
```

Descompacte com `tar` em `/tmp`: `tar xvzf rootfs.tar.gz --directory=/tmp` .

Se listar `rootfs/boot` não tem o kernel e nem a `initram` que deveria.

## 3.1. Isolando a estrutura de arquivos

Vamos mudar a raiz do sistema para `rootfs` e executar o `bash`:

```shell
sudo chroot rootfs /bin/bash
```

Esse shell não tem mais acesso ao meu sistema de arquivos real. Muitos comandos podem deixar de funcionar, já que esse *shell* pode não ter carregado um perfil. Se precisar crie pelo menos o `PATH`:

```shell
export PATH=/sbin:/bin:/usr/bin
```

Normalmente essa variável já vem configurada em `/etc/profile`, `/etc/environment`, `~/.bashrc` ou `~/.zshrc`, por exemplo.

Se tentarmos ver os processos (`ps`), também ocorrerá erro, já que não montamos nenhum local para os processos registrarem dados e podermos consultá-los. Vamos criar o shell novamente de forma que corrija esse problema:

```shell
sudo unshare -f -p --mount-proc=/tmp/rootfs/proc chroot rootfs /bin/bash
```

## 3.2. Capability

Uma *capability* é um objeto ou "token" que representa a habilidade de um processo de acessar um certo recurso, tal como um arquivo ou uma conexão de rede.

Para verificar as capabilities:

```shell
capsh --print
```

Para verificar as capacidades habilitadas de um processo:

```shell
grep Cap /proc/$PID/status
```

Para decodificar o bitset e verificar as capabilities:

```shell
capsh --decode=$bitset
```

Para compreender o que cada capability representa:

```shell
man capabilities
```

E para saber como habilitar e desabilitar essas capacidades estude o comando `prctl` (*Process Control*).

# 4. Considerações Finais

Perceba que com todos os aspectos até aqui apresentados, escondemos não apenas os PIDs, mas também o sistema de arquivos. Veja que é possível isolar os recursos, sistemas de arquivos, controle de acesso, etc, e é isso que um *container* faz. A principal diferença podemos dizer que é essa, um *container* executa em um espaço isolado aproveitando a arquitetura e o Kernel do *host*, já uma máquina virtual roda um novo kernel possivelmente em outra arquitetura de hardware.

Por exemplo, vamos baixar uma imagem e executar um *container*:

```shell
docker run --name container_ola hello-world
```

Agora vamos exportar o *container* para um arquivo `tar`:

```shell
docker export container_ola > hello.tar
```

Se descompactarmos veremos a estrutura de arquivos que foi executada em um espaço isolado:

```shell
mkdir /tmp/hello
tar xvf hello.tar --directory /tmp/hello
cd /tmp/hello
./hello
```

