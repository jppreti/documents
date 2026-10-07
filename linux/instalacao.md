# Para adicionar ao .zshrc:

```shell
SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
    /usr/bin/ssh-add ~/.ssh/ifmt_ed25519
    /usr/bin/ssh-add ~/.ssh/gmail_ed25519
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
```

# Instalar e configurar

```shell
sudo pamac install ripgrep
sudo pamac install zoxide
zoxide init zsh
sudo pamac install btop ctop gtop
sudo pamac install atuin
atuin setup
atuin import auto
atuin register -u jppreti -e jppreti@gmail.com
atuin sync
nano ~/.config/atuin/config.toml # search_mode="prefix"
```

# Adicionar alias

```shell
alias k="eza --icons --group-directories-first"
alias vim="nvim"
alias lsfzf='ls | fzf --preview "bat -f {}" | awk "{print $0}" | xargs nvim'
alias http-code='curl -s -o /dev/null -w "%{http_code}"'
alias kk='eza --icons --group-directories-first -TL=2'
alias kkk='eza --icons --group-directories-first -TL=3'
alias sql='PGPASSWORD=postgres psql -h localhost -U postgres -d postgres -p 5432 -c'
alias sqb='PGPASSWORD=digite_senha_aqui psql -h cbmmt.academy -U telemetria -d aerotrack -c'
```

