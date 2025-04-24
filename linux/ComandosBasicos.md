# 1. Comandos Básicos em Linux

```mermaid
flowchart TD
    Linux["fab:fa-linux Linux"]-->Sist.Arquivos
    Linux-->Texto
    Linux-->Disco
    Linux-->Permissões
    Linux-->Processos
    Linux-->Rede
    Linux-->Util
    click Sist.Arquivos "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#sistema-de-arquivos"
    click Texto "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#texto"
    click Disco "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#disco"
    click Permissões "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#permissões"
    click Processos "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#processos"
    click Rede "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#rede"
    click Util "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#utilitários"
```

## Sistema de Arquivos

```mermaid
flowchart TD
    Sist.Arquivos-->mkdir
    Sist.Arquivos-->cd
    Sist.Arquivos-->ls
    Sist.Arquivos-->rm
    Sist.Arquivos-->cp
    Sist.Arquivos-->mv
    Sist.Arquivos-->pwd
    Sist.Arquivos-->touch
    Sist.Arquivos-->mlocate
    Sist.Arquivos-->tree
    click mkdir "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#mkdir"
    click cd "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#cd"
    click ls "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#ls"
    click rm "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#rm"
    click cp "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#cp"
    click mv "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#mv"
    click pwd "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#pwd"
    click touch "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#touch"
    click mlocate "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#mlocate"
    click tree "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#tree"
```

### ls

Lista o conteúdo de um diretório

`ls`

A saída padrão do comando ls exibe apenas o nome dos arquivos e diretórios. Utilize a opção `-l` para o formato longo:

```shell
ls -l 
```

O comando `ls` não lista os arquivos ocultospor padrão. Um arquivo oculto é qualquer arquivo que comece com (`.`). Para exibir os arquivos ocultos utilize a opção `-a`:

```shell
ls -a
```

### pwd

Exibe o caminho do diretório atual.

```shell
pwd
```

### cd

Muda de diretório.

Quando utilizado sem argumentos irá posicioná-lo em seu diretório `home`:

```shell
cd
```

Pode utilizar caminhos relativos ou absolutos para mudar de diretório:

Segue exemplo de navegação para o diretório `Downloads`, neste caso o usuário logado é o `jppreti`:

```shell
cd /Users/jppreti/Downloads
```

Se já está posicionado no diretório `/Users/jppreti` basta executar: 

```shell
cd Download
```

Para voltar ao diretório anterior:

```shell
cd ../
```

Para subir mais dois níveis:

```shell
cd ../../
```

Para voltar ao diretório anterior utilize o traço (`-`) como argumento:

```shell
cd -
```

### mkdir

Cria um diretório vazio.

Criando um novo diretório dentro do diretório atual:

```shell
mkdir novo_diretorio
```

### touch

Cria um arquivo em branco.

```shell
touch arquivo.txt
```

### rm

Exclui arquivos e diretórios.

Removendo um arquivo:

```shell
rm arquivo.txt
```

Removendo um diretório vazio:

```shell
rm -d diretorio
```

Para remover um diretório que não está vazio e apagar todo seu conteúdo de forma recursiva, utilize o argumento `-r` (recursive), já o parâmetro `f` (force) não pede confirmação :

```shell
rm -rf diretorio
```

### cp

Permite copiar arquivos e diretórios:

Para criar uma cópia do arquivo dentro do mesmo diretório basta utilizar o nome do arquivo de origem e outro nome para o novo arquivo:

```shell
cp arquivo.txt novo_arquivo.txt
```

Para copiar um arquivo para outro diretório faz-se necessário especificar o caminho relativo ou absoluto do diretório de destino. Se especificar apenas o caminho do diretório de destino então a cópia terá o mesmo nome do arquivo original.

```shell
cp arquivo.txt /Users/jppreti/Downloads
```

Por padrão se o arquivo já existir no destino ele será sobrescrito.

Para copiar um diretório incluindo todos os arquivos e subdiretórios dentro dele, utilize a opção `-r`:

```shell
cp -r fotos /Users/jppreti/Desktop
```

### mv

Comando utilizado para renomear ou mover arquivos e diretórios de um local para outro.

Por exemplo, movendo um arquivo para outro diretório:

```shell
mv arquivo.txt /Desktop
```

Para renomear um arquivo é necessário especificar o nome do arquivo no destino:

```shell
mv arquivo.txt novo_nome.txt
```

Para mover vários arquivos e diretórios, especifique o diretório de destino ao final:

```shell
mv arquivo1.txt arquivo2.txt /Desktop
```

### mlocate

Comando utilizado para localizar um arquivo. A opção `-i` faz com que ele ignore a diferença entre maiúsculas e minúsculas.

Para procurar um arquivo que contém duas ou mais palavras, use um asterisco `*`. Por exemplo:

```shell
mlocate -i laboratorio*programacao
```

Encontra qualquer arquivo que tenha as palavras `laboratorio` e `programacao`, não importando se as letras são maiúsculas ou minúsculas.



### tree

Localiza arquivos e exibe o caminho da localização em um formato hierárquico:

```bash
tree -P '*.c' --prune
```

Localiza todos os arquivos com extensão `.c` e exibe em formato hierárquico a localização desses arquivos.

### which

Exibe a localização de um comando Linux:

```bash
which tree
```

## Texto

```mermaid
flowchart TD
    Texto-->vim
    Texto-->cat
    Texto-->more
    Texto-->head
    Texto-->tail
    Texto-->diff
    Texto-->grep
    Texto-->cut
    Texto-->wc
    click vim "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#vim"
    click cat "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#cat"
    click more "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#more"
    click head "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#head"
    click tail "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#tail"
    click diff "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#diff"
    click grep "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#grep"
    click cut "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#cut"
    click wc "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#wc"
```

### cat

Exibe o conteúdo de um arquivo.

```shell
cat /Users/jppreti/Downloads/abc.txt
```

O comando `cat` tem vários propósitos: pode ser utilizado para criar um arquivo, copiar o conteúdo de um arquivo para outro arquivo e mais.

### more

Comando similar ao `cat` , já que exibe o conteúdo de um arquivo. A única diferença é que no caso de arquivos cujo conteúdo não caiba todo na tela, o comando `more`permite exibir o conteúdo na forma de rolagem para que possa ir visualizando o conteúdo de acordo com a interação do usuário.

```shell
more /Users/jppreti/Downloads/abc.txt
```

### vim

Editor de texto de terminal.

```shell
vim arquivo.txt
```

### head

O comando head é usado para ver as primeiras linhas de um arquivo de texto. Por padrão, ele vai mostrar as primeiras 10 linhas, mas você pode mudar essa quantidade utilizando a opção `-n`: 

```shell
head -n 5 arquivo.txt.
```

### tail

O comando `tail` tem função similar ao comando `head`, mas mostra as últimas linhas de um arquivo.

```shell
tail -n 5 arquivo.txt
```

### diff

O comando `diff` (diferença) compara o conteúdo de dois arquivos linha por linha.

```shell
diff arquivo1.txt arquivo2.txt
```

### grep

Permite que você procure dentro de um arquivo específico. Por exemplo:

```shell
grep chown comandosbasicos.txt
```

Procura pela palavra `chwon` no arquivo comandosbasicos.txt. Linhas que contêm a palavra pesquisada serão mostradas por completo.

### cut

Permite selecionar colunas que se deseja exibir do conteúdo de um arquivo. O parâmetro `-d` permite definir o limitador das colunas e o parâmetro `-f` permite especificar quais colunas deseja exibir:

```shell
cut -d: -f1,6 /ect/passwd
```

Exibe as colunas `1` e `6` do arquivo `passwd` que possui como separador o `:`. Nesse exemplo será exibido o `nome` (coluna 1) dos usuários do sistema e o diretório `home` (coluna 2) de cada usuário.

### wc

Contabiliza linhas, palavras e caracteres de um arquivo.

```shell
wc arquivo.txt
```

### sed

Para processamento de texto, como buscar e substituir, inserção e exclusão.

Por exemplo, para substituir a primeira ocorrência em cada linha da palavra unix para linux:

```shell
sed 's/unix/linux/' arquivo.txt
```

Ou substituir todas as ocorrências (global) da palavra unix para linux:

```shell
sed 's/unix/linux/g' arquivo.txt
```

Imprimir de cada palavra a primeira letra entre parênteses:

```shell
echo "Welcome To The Geek Stuff" | sed 's/\(\b[A-Z]\)/\(\1\)/g'
```

Excluir uma linha em particular do arquivo:

```shell
sed '5d' arquivo.txt
```

Excluir a última linha

```shell
sed '$d' arquivo.txt
```

Excluir linhas de x a y:

```shell
sed '3,6d' arquivo.txt
```

Excluir tudo a partir de uma linha:

```shell
sed '3,$d' arquivo.txt
```

Excluir linha que combine com um padrão:

```shell
sed '/abc/d' arquivo.txt
```

Inserir linha antes ou depois de uma linha:

```shell
sed '3i\new text' filename
sed '3a\new text' filename
```

## Permissões

```mermaid
flowchart TD
    Permissões-->sudo
    Permissões-->su
    Permissões-->adduser
    Permissões-->passwd
    Permissões-->deluser
    Permissões-->usermod
    Permissões-->chown
    Permissões-->chmod
    Permissões-->whoami
    Permissões-->id
    click sudo "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#sudo"
    click su "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#su"
    click adduser "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#adduser"
    click passwd "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#passwd"
    click deluser "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#deluser"
    click usermod "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#usermod"
    click chmod "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#chmod"
    click chown "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#chown"
    click whoami "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#whoami"
    click id "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#id"
```

### sudo

Eleva os privilégios do usuário.

O comando `sudo` permite executar comandos como outro usuário, por padrão é o usuário `root`.

Alguns exemplos:

```shell
sudo apt update
sudo apt upgrade 
sudo apt install ansible -y
sudo cat /temp/
```

### su

Fornece acesso administrativo para outro usuário. Em outras palavras, permite o acesso ao shell para outro usuário, realizando outro login.

```shell
su jppreti
```

### passwd

Permite mudar a senha do usuário:

```shell
passwd
```

### usermod

Adiciona usuários a grupos.

Para adicionar um usuário para um grupo utilize o argumento `-G` seguido do nome do grupo:

```shell
usermod -a -G Docker Jenkins
```

### chmod

Muda as permissões de leitura (`+r`), escrita (`+w`) e execução (`+x`) de um arquivo ou diretório. Por exemplo:

```shell
chmod +x arquivo.sh
```

Torna o `arquivo.sh` passível de execução.

### chown

No Linux, todos os arquivos são de propriedade de um usuário específico. O comando chown permite que você mude ou transfira a propriedade de um arquivo para um usuário específico. O exemplo abaixo transfere a propriedade de um arquivo para o usuário `jppreti`.

```shell
chown jppreti arquivo.txt
```

### whoami

Comando que exibe qual é o usuário logado.

### id

Comando utilizado para exibir do usuário logado seu código de usuário e dos grupos a que pertence.

```shell
id
```

## Disco

```mermaid
flowchart TD
    Disco-->df
    Disco-->du
    click df "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#df"
    click du "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#du"
```

### df

Informa o uso do disco pelo sistema em KBs. Use a opção `-h` para visualizar em KBs, MBs, etc.

```shell
df -h
```

### du

Informa o quanto de espaço um arquivo ou diretório está ocupando no disco. Utilize a opção `-h` (human readable) para exibir em KBs, MBs, etc.

```shell
du -h
```

## Processos

```mermaid
flowchart TD
    Processos-->top
    Processos-->ps
    Processos-->kill
    Processos-->service
    click top "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#top"
    click ps "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#kill"
    click kill "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#kill"
    click service "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#service"
```

### top

Exibe os processos atuais que estão consumindo a maioria dos recursos da máquina. Por exemplo:

```shell
top -u jppreti
```

Exibe os processos em execução do usuário `jppreti`. Ao pressionar a letra `K` pode-se informar o número do processo (`PID`) que deseja encerrar.

### kill

Se você tem um programa que não está respondendo bem, você pode finalizá-lo manualmente pelo comando `kill`. Ele vai mandar um sinal ao aplicativo com mau funcionamento e instruir que este seja encerrado.

É preciso conhecer o número de identificação do processo (`PID`) do programa que você deseja encerrar, que pode ser obtido pelo comando `top` ou pelo comando `ps ux`.  

```shell
kill 1234
```

Encerra o processo de código 1234.

### service

Comando utilizado para gerenciar serviços disponíveis na máquina. É possível iniciar um serviço, parar e reiniciar além de poder listar todos os serviços disponíveis:

```shell
service --status-all
```

### nohup

Torna um comando imune ao hangup signal. Um comando executado com nohup continua executando mesmo que a sessão do terminal encerre ou que o usuário deslogue. A saída é redirecionada para um arquivo de log (nohup.out) por padrão.

```shell
nohup projecteur &
```

## Rede

```mermaid
flowchart TD
    Rede-->ping
    Rede-->wget
    Rede-->hostname
    Rede-->ifconfig
    Rede-->ssh
    click ping "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#ping"
    click wget "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#wget"
    click hostname "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#hostname"
    click ifconfig "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#ifconfig"
    click ssh "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#ssh"
```

### ping

Verifica o status da conexão de um dispositivo na rede. Por exemplo:

```shell
ping google.com
```

Checa se o Google está acessível e também mede o tempo de resposta.

### wget

Permite baixar arquivos da internet, simplesmente digite `wget` seguido pelo link de download do arquivo.

### ssh

Conectando a uma instância EC2 via terminal:

```shell
ssh -i file.pem username@ip-address
```

`-i`: Espeficica uma forma de identificação alternativa por meio de arquivo com achave pública.
username: nome de usuário para login `ip-address`: endereço da instância EC2

Outras comandos SSH importantes que vão além do cliente SSH.

`ssh-keygen` — criar um par de chaves para autenticação por chave pública `ssh-copy-id` — configura uma chave pública como autorizada em um servidor `ssh-agent` — agente para manter a chave privada para single sign-on `ssh-add` — ferramenta para adicionar uma chave ao agente `scp` — cliente para transferência de arquivo no estilo de linha de comando RCP `sftp` — cliente para transferência de arquivo no estilo de linha de comando FTP `sshd` — servidor OpenSSH

### hostname

Informa qual seu host/network (da sua rede), se adicionar -I ao final, exibirá o endereço IP da sua rede.

```shell
hostname -i
```

### ifconfig

Comando que exibe detalhes sobre as interfaces de rede e suas configurações da sua máquina.

### ip addr

Comando para exibir informações sobre as interfaces de rede:

### ip route

Exibe a tabela de rotas.

### route -n

Exibe as rotas ativas

Para adicionar uma rota estática:

```shell
route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.1
```

### ethtool eth0

Mostrar a velocidade da interface, se o cabo está conectado e em que modo está operando.

### ethtool -S eth0

Exibe as estatísticas de RX e TX da interface.

### ethtool -p eth0 60

Deixar a interface piscando para podermos identificar qual é a interface fisicamente, 60 equivale a 60 segundos.

### ethtool -s eth0 speed 100 duplex

Manipular a velocidade da interface e o modo de negociação, half-duplex ou full-duplex.

### ethtool -i eth0

Verificar informações sobre o driver da interface de rede

### /etc/resolv.conf

Armazena as configurações de DNS.

### /etc/hosts

Associa endereços IP a hostnames.

## Utilitários

```mermaid
flowchart TD
    Util-->uname
    Util-->history
    Util-->man
    Util-->clear
    Util-->bc
    Util-->keycuts
    click uname "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#uname"
    click history "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#history"
    click man "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#man"
    click clear "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#dicas"
    click bc "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#bc"
    click keycuts "https://github.com/jppreti/documents/blob/main/linux/ComandosBasicos.md#dicas"
```

### uname

Significa Unix Name, mostra informações detalhadas sobre seu sistema Linux. Isso inclui o nome da máquina, do sistema operacional, do kernel, etc.

```shell
uname -a
```

### history

Comando que permite rever o histórico de comandos que você já exxecutou no linux.

### man

Está em dúvida sobre como usar um comando, use `man` (manual) para obter ajuda, por exemplo:

```shell
man tail
```

### bc

Calculadora.

```shell
expr 20 + 5
```
ou
```shell
bc
```
ou
```shell
echo '20 + 5' | bc
echo '20 \* 5' | bc
```

Apresenta ajuda sobre como utilizar o comando `tail`.

### Dicas

O comando `clear` limpa o terminal, útil quando a tela estiver cheia de muitos comandos utilizados anteriormente. 

Experimente a tecla `TAB` para preencher automaticamente o que você está digitando. Por exemplo, se você precisa digitar `Downloads`, comece a digitar o comando (vamos usar o `cd Dow`, então aperte a tecla `TAB`) e o terminal preencherá o restante.

`Ctrl + C` e `Ctrl + Z` são usados para qualquer comando que esteja em execução. `Ctrl + C` interromperá o comando com segurança, e `Ctrl + Z` interrompe de forma abrupta.

Caso o terminal trave acidentalmente com o `Ctrl + S`, simplesmente desfaça o congelamento com `Ctrl + Z` ou `CTRL + C`.

`Ctrl + A` move o cursor para o início da linha enquanto `Ctrl + E` move o cursor para o final.

Você pode executar vários comandos em um único comando usando o `;` , por exemplo: 

```shell
ls ; pwd ; whoami
```

Ou use `&&` se desejar que o próximo comando seja executado apenas quando o primeiro comando indicado estiver funcionando.

Use o caractere pipe `|` para fazer com que a saída de um comando possa ser utilizada como entrada de outro. Por exemplo:

```shell
du -h | head -n 10
```

Lista apenas as 10 primeiras linhas do resultado do comando `du`.
