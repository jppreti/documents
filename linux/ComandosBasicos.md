# 1. Comandos Básicos em Linux

## 1.1. ssh
Conectando a uma instância EC2 via terminal:

```shell
ssh -i file.pem username@ip-address
```

`-i`: Espeficica uma forma de identificação alternativa por meio de arquivo com a chave pública.
username: nome de usuário para login
`ip-address`: endereço da instância EC2

Outras comandos SSH importantes que vão  além do cliente SSH.

`ssh-keygen` — criar um par de chaves para autenticação por chave pública
`ssh-copy-id` — configura uma chave pública como autorizada em um servidor
`ssh-agent` — agente para manter a chave privada para single sign-on
`ssh-add` — ferramenta para adicionar uma chave ao agente
`scp` — cliente para transferência de arquivo no estilo de linha de comando RCP
`sftp` — cliente para transferência de arquivo no estilo de linha de comando FTP
`sshd` — servidor OpenSSH

## 1.2. ls
Lista o conteúdo de um diretório

`ls`

A saída padrão do comando ls exibe apenas o nome dos arquivos e diretórios. Utilize a opção `-l` para o formato longo:

```shell
ls -l 
```

O comando ls não lista os arquivos ocultospor padrão. Um arquivo oculto é qualquer arquivo que comece com (`.`). Para exibir os arquivos ocultos utilize a opção `-a`:

```shell
ls -a
```

## 1.3. pwd
Exibe o caminho do diretório atual.

```shell
pwd
```

## 1.4. cd
Muda de diretório.

Quando utilizado sem argumentos irá posicioná-lo em seu diretório `home`:

```shell
cd
```

Pode utilizar caminhos relativos ou absolutos para mudar de diretório:

Segue exemplo de navegação para o diretório `Downloads`, neste caso o usuário logado é o jppreti:

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

Para voltar ao diretório anterior utilize o traço (-) como argumento:

```shell
cd -
```

## 1.5. mkdir
Cria um diretório vazio.

Criando um novo diretório dentro do diretório atual:

```shell
mkdir novo_diretorio
```

## 1.6. cat
Exibe o conteúdo de um arquivo.

```shell
cat /Users/jppreti/Downloads/abc.txt
```

## 1.7. touch
Cria um arquivo em branco.

```shell
touch arquivo.txt
```

## 1.8. vim
Editor de texto de terminal.

```shell
vim arquivo.txt
```

## 1.9. rm
Exclui arquivos e diretórios.

Removendo um arquivo:

```shell
rm arquivo.txt
```

Removendo um diretório vazio:

```shell
rm -d diretorio
```

Para remover um diretório que não está vazio e apagar todo seu conteúdo de forma recursiva, utilize o argumento `-r`:

```shell
rm -rf diretorio
```

## 1.10. cp
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

## 1.11. mv
Comando utilizado para renomear ou mover arquivos e diretórios de um local para outro.

Por exemplo, movendo um arquivo para outro diretório:

```shell
mv arquivo.txt /Desktop
```

Para renomear um arquivo é necessário especificar o nome do arquivo no destino:

```shell
mv arquivo.txt novo_nome.txt
```

Para mover varios arquivos e diretorios, especifique o diretório de destino ao final:

```shell
mv arquivo1.txt arquivo2.txt /Desktop
```

## 1.12. sudo
Eleva os privilégios do usuário.

O comando `sudo` permite executar comandos como outro usuário, por padrão é o usuário `root`.

Alguns exemplos:

```shell
sudo apt update
sudo apt upgrade 
sudo apt install ansible -y
sudo cat /temp/
```

## 1.13. usermod
Adiciona usuários a grupos.

Para adicionar um usuário para um grupo utilize o argumento -G seguido do nome do grupo:

```shell
usermod -a -G Docker Jenkins
``` 
