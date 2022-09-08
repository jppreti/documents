# O que é?

Um ponteiro é um tipo especial de variável que guarda como dado um endereço de memória.

# Para que serve?

O tipo ponteiro é importante para que possamos, por exemplo, compartilhar o dado de uma variável em vários pontos diferentes do nosso programa.

Caso contrário, o dado seria replicado e não compartilhado, ou seja, teríamos várias cópias diferentes do mesmo valor, cada cópia em um endereço de memória diferente.

# Estrutura

```c
<tipo>* nomeVariavel;
```

Exemplo:

```c
int* number;
```

Temos portanto uma variável `number` que não guarda um número inteiro, mas sim um endereço de memória. Esse endereço sim contém um número inteiro.

## Faça o teste

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int* number;
    printf("number: %p", number);
    return EXIT_SUCCESS;
}
```

Veja que a impressão na tela é de um valor que representa o endereço de memória guardado por number, nesse caso `0x7ffeefbff4a8`.

Veja bem, não é o endereço da variável `number` e sim um endereço de memória guardado pela variável `number`.

## Melhorando o exemplo

Vamos melhorar o exemplo para que possamos entender melhor esse conceito.

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int number = 10;
    int *numberP = &number;
    printf("Valor da variável number: %d\n",number);
    printf("Endereço da variável number: %p\n",&number);
    printf("Valor da variável numberP: %p\n",numberP);
    printf("Valor apontado por numberP: %d\n\n",*numberP);
}
```

### Vejamos passo a passo:

Criamos 2 variáveis:

```c
int number = 10;
int *numberP = &number;
```

A variável `number` guarda um número inteiro (10), já a variável `numberP` guarda o endereço de memória da variável `number` (`0x7ffeefbff48c`).

Por isso, quando mandamos imprimir, obtemos os seguintes valores:

- `number`: imprime o valor guardado na variável number (10);
- `&number`: imprime o endereço de number (0x7ffeefbff48c);
- `numberP`: imprime o valor guardado na variável numberP (0x7ffeefbff48c);
- `*numberP`: imprime o valor guardado no endereço apontado por numberP (10);

Portanto, podemos modificar de forma *indireta* o valor de `number` por meio de `numberP`:

```c
*numberP = 15; //é a mesma coisa que fazer number = 15;
```

Faça o teste, adicione essa linha e mande imprimir o valor de number. Você perceberá que o valor será modificado para 15.

# Aritmética de Ponteiro

A ideia aqui é entender o que acontece quando utilizamos operadores aritméticos em variáveis que são do tipo ponteiro.

Por exemplo, se a variável number possui o valor 15 e fazemos `number++`, o número inteiro 15 é incrementado em 1 unidade, ou seja, 16.

Mas e se fizermos isso em `numberP`, por exemplo, `numberP++`.

## Continuando nosso exemplo

```c
...
numberP++;
printf("Valor da variável numberP: %p\n", numberP);
printf("Valor no endereço apontado: %d\n", *numberP);
...
```

Perceba que ao fazer o incremento em uma variável do tipo ponteiro foi o **endereço de memória que incrementou**, mudando de `0x7ffeefbff48c` para `0x7ffeefbff490`.

Veja que o incremento foi de 4 bytes no endereço, ou seja, o tamanho do tipo `int`. Faz sentido, para que possamos ler o próximo número inteiro na memória, precisamos avançar pelo menos 4 bytes na memória.

Se tivéssemos feito `numberP--` o resultado teria sido `0x7ffeefbff488`, ou seja, precisamos retroceder em 4 bytes para ler o número inteiro anterior.

### Mas e esse resultado estranho?

O resultado –272632664 representa a interpretação dos 32 bits de dados guardados a partir do endereço `0x7ffeefbff490` como um número inteiro.

Esses 32 bits (4 bytes) lidos a partir do endereço `0x7ffeefbff490` podem ser qualquer coisa, na verdade não sabemos o que é. Pelo resultado provavelmente temos o seguinte arranjo binário:

```shell
0x7ffeefbff490  0x7ffeefbff49a  0x7ffeefbff49b  0x7ffeefbff49c
10010000        01000000        00001011        01011000
```

Pode não ser um número inteiro, pode ser parte de um dado (parte de um long, por exemplo), pode ser uma mesclagem de dados (parte de um char e um int), pode nem ser mais um dado válido, ou seja, esse endereço foi usado em algum momento mas agora representa apenas um lixo na memória.

Por isso temos que ter muito cuidado ao realizar aritmética de ponteiros.

Podemos corromper dados da memória e causar um crash no programa.

Podemos acessar uma área da memória de outro programa ou até mesmo do Sistema Operacional e causar um crash no sistema.

## Como usar apenas endereços livres?

Quando você precisar de um endereço de memória que não esteja sendo usado pelo seu programa ou outro programa qualquer, usamos a instrução `malloc`.

A função `malloc` (*memory allocation*) aloca espaço para um bloco de bytes consecutivos na memória RAM e devolve o endereço inicial desse bloco. O número de bytes é especificado no argumento da função.

Por exemplo, se precisarmos de um endereço livre para alocarmos um número `float` fazemos o seguinte:

```c
...
float *pi = (float *) malloc(sizeof(float));
...
```

A função `sizeof` retorna a quantidade de bytes necessária para armazenar um `float`.

Pronto, agora podemos armazenar um `float` em um endereço de memória livre e com espaço suficiente para caber um `float`.

```c
...
printf("Valor da variável pi: %p\n", pi);
*pi=3.1415;
printf("Valor no endereço apontado: %f\n", *pi);
...
```

Quando não precisar mais do endereço você precisará informar isso por meio da instrução `free`. Caso contrário nossa aplicação só cresceria de tamanho durante sua execução e ficaria com muitos dados inúteis (lixo) na memória.

```c
...
free(pi);
printf("Valor da variável pi: %p\n", pi);
printf("Valor no endereço apontado: %f\n", *pi);
...
```

No caso do meu compilador, após a execução de `free`, a variável `pi` continuou com o endereço de memória `0x100635e90` e com o valor `3.141500`.

Isso não quer dizer que a memória não foi liberada. A memória foi liberada e pode ser que um novo `malloc` distribua esse endereço `0x100635e90` como livre.

O que acontece é que a instrução free não zerou a variável `pi` e nem limpou os bits da memória a partir do endereço `0x100635e90`.

Se não quiser deixar rastro na memória, você pode fazer:

```c
...
*pi = 0;
pi = NULL;
...
```

# Vetor com Ponteiros

Como a função `malloc` reserva espaços contíguos (sequenciais) na memória, podemos então utilizá-la para criar estruturas do tipo array (vetor).

Vejamos a seguinte declaração:

```c
...
int *numbers = (int *) malloc(sizeof(int) * 3);
...
```

Perceba que alocamos **3 vezes** o tamanho de um `int`. Agora podemos preencher como segue:

```c
...
*(numbers+0) = 1;
*(numbers+1) = 2;
*(numbers+2) = 3;
...
```

É a mesma coisa que fazer:

```c
...
numbers[0] = 1;
numbers[1] = 2;
numbers[2] = 3;
...
```

Você pode testar, as duas formas são válidas para preencher a variável `numbers`. Então podemos imprimir os valores conforme segue:

```c
for (int i = 0; i < 3; i++)
    printf("numbers[%d] = %d\n",i,numbers[i]);
```

Poderíamos também ter feito:

```c
for (int i = 0; i < 3; i++)
    printf("*(numbers+%d) = %d\n",i,*(numbers+i));
```

Ou:

```c
int *aux = numbers;
for (int i = 0; i < 3; i++) {
    printf("aux = %d\n",*aux);
    aux++;
}
```

# Código Completo

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int number = 10;
    int *numberP = &number;
    printf("Valor da variável number: %d\n",number);
    printf("Endereço da variável number: %p\n",&number);
    printf("Valor da variável numberP: %p\n",numberP);
    printf("Valor apontado por numberP: %d\n\n",*numberP);
    printf("Mudando o valor de number de forma indireta\n\n");
    *numberP = 15;
    printf("Valor da variável number: %d\n",number);
    numberP++;
    printf("Valor da variável numberP: %p\n", numberP);
    printf("Valor no endereço apontado: %d\n", *numberP);
    float *pi = (float *) malloc(sizeof(float));
    printf("Valor da variável pi: %p\n", pi);
    *pi=3.1415;
    printf("Valor no endereço apontado: %f\n", *pi);
    free(pi);
    printf("Valor da variável pi: %p\n", pi);
    printf("Valor da variável apontada: %f\n", *pi);
    *pi = 0;
    pi = NULL;
    int *numbers = (int *) malloc(sizeof(int) * 3);
    *(numbers+0) = 1;
    *(numbers+1) = 2;
    *(numbers+2) = 3;

    for (int i = 0; i < 3; i++)
        printf("numbers[%d] = %d\n",i,numbers[i]);

    for (int i = 0; i < 3; i++)
        printf("*(numbers+%d) = %d\n",i,*(numbers+i));

    int *aux = numbers;
    for (int i = 0; i < 3; i++) {
        printf("aux = %d\n",*aux);
        aux++;
    }
    return EXIT_SUCCESS;
}
```