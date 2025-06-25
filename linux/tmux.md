# TMUX - Multiplexador

`tmux new -s devops` = cria uma nova sessão de nome devops.

`tmux ls` = Listar todas as sessões .

Comando principal = `CTRL + b` (^b)

```shell
^b + c = Nova Janela
^b + " = Modo Horizontal
^b + % = Modo Vertical
^b + d = Detached
```

`^b + <-^->` para movimentar entre os painéis.

`^b + hold CTRL + <-^->` para redimensionar o painel.

`^b + space` altera o layout dos painéis.

`^b + x` para fechar o painel.

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

## Se movimentando como um profissional

Para mudar entre janelas: `^b` + `n` para next e `p` para previous.

Para renomear a janela `^b + ,`.

Para mover-se para uma janela específica: `^b + 2`.

## Copiar e Colar no terminal?

- `^b + [` para entrar no modo scroll. Movimente utilizando as setas;
- Pressione espaço para começar a selecionar;
- Mova até o final e pressione Enter para copiar;
- Para colar use `^b + ]`.

## Algumas dicas

Abra o arquivo `~/.tmux.conf` e adicione:

```shell
# Easy pane switching
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
# Use Vim-style keys in copy mode
setw -g mode-keys vi
# Keep longer scrollback history
set -g history-limit 10000
```

Para aplicar as alterações:

`tmux source-file ~/.tmux.conf`