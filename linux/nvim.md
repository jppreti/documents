# Nvim

Veja a lista de fontes disponíveis para instalação:

```shell
pacman -Sgq nerd-fonts
```

Instale sua fonte favorita:

```shell
sudo pacman -S ttf-jetbrains-mono-nerd
```

Instale o NeoVim

```shell
sudo pacman -S neovim
```

Instale o NvChad com plugins para o NeoVim:

```shell
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```

Dentro do editor nvim execute os comandos para:

- `:MasonInstallAll` para instalar todos os plugins;
- `:Lazy sync` para atualizar os plugins;
- `:NvimTreeFocus` para abrir a árvore de arquivos;
- `:!<comando_linux>` para executar um comando no terminal.

Utilize a tecla TAB para receber sugestões de comandos (autocomplete).

