# Configurando um Dynamic DNS

Serve para permitir que computadores que não possuem IP fixo possam estar acessíveis por um domínio.

Instale pela sua store o ddclient.

Habilite o start automático:

```shell
systemctl enable ddclient.service
```

Inicie pela primeira vez manualmente:

```shell
systemctl start ddclient.service
```

Edite o arquivo /etc/ddclient/ddclient.conf:

```code
if=wlp0s20f3
use=if
protocol=cloudflare
zone=try.app.br
ttl=1
login=token
password=IqsbMn...
try.app.br, preti.try.app.br
```

Reinicie o serviço ddclient:

```shell
service ddclient restart
```

Para verificar as interfaces disponíveis:

```shell
sudo ddclient -query
```

Para verificar o status do serviço ddclient:

```shell
sudo ddclient -daemon=0 -verbose
```

Lembre-se de liberar as portas desejadas no firewall:

```shell
sudo ufw allow 8000/tcp
```
