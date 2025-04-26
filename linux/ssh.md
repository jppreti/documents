Instale o OpenSSH (se necessário)

```shell
sudo pacman -S openssh
```

Verifique o status do serviço SSH

```shell
sudo systemctl status sshd.service
```

Edite o arquivo de configuração do Daemon SSH (se necessário)

```shell
sudo nano /etc/ssh/sshd_config
```

Habilite e inicie o serviço SSH

```shell
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
```

Teste a conectividade SSH

```shell
ssh -p 22 jppreti@localhost
```
