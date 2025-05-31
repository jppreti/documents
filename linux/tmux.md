# TMUX - Multiplexador

`tmux ls` = Listar todas as sessões 

Comando principal = `CTRL + b` (^b)

```shell
^b + c = Nova Janela
^b + " = Modo Horizontal
^b + % = Modo Vertical
^b + d = Detached
```

`tmux a -t ID_SESSAO` para attach novamente a sessão que foi detached

Dois desenvolvedores podem "atachar" a mesma sessao para cada um ver o que o outro está fazendo.

```shell
^b + $ = Renomeia a sessão
^b + . = Renomeia a janela
^b + z = Maximiza ou Restaura a janela atual
^b + w = Modo interativo para navegar entre as sessões e janelas
tmux new -s NOME_SESSAO -d = Cria uma sessão sem precisar se conectar a ela
tmux kill-session -t NOME_SESSAO = Encerra uma sessão específica
tmux kill-server = Encerra todas as sessões 
```
