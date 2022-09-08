# O que é?

Um ponteiro duplo nada mais é do que um **ponteiro para outro ponteiro**.

Ao invés do ponteiro apontar para um endereço de memória que contenha um dado como `long`, `int`, `float`, …, na verdade nesse endereço contém outro endereço de memória.

Exemplo:

```c
...
int number = 10;
int *numberP = &number;
int **numberPP = &numberP;
...
```

Perceba que a variável `numberPP` guarda o endereço de memória de `numberP` que é um ponteiro. Isso quer dizer que se imprimirmos `*numberPP` teremos o **endereço de number** e se imprimirmos `**numberPP` teremos o número **10**.

| Endereço       | Variável | Conteúdo       |
| -------------- | -------- | -------------- |
| 0x7ffeefbff480 | numberP  | 0x7ffeefbff488 |
| 0x7ffeefbff484 | numberPP | 0x7ffeefbff480 |
| 0x7ffeefbff488 | number   | 10             |

Faça o teste:

```c
...
printf("Valor da variável number: %d\n", number);
printf("Endereço da variável number: %p\n", &number);
printf("Valor da variável numberP: %p\n", numberP);
printf("Endereço da variável numberP: %p\n", &numberP);
printf("Valor da variável numberPP: %p\n", numberPP);
printf("Valor de *numberPP: %p\n", *numberPP);
printf("Valor **numberPP: %d\n", **numberPP);
...
```

Meu resultado foi:

```shell
Valor da variável number: 10
Endereço da variável number: 0x7ffeefbff488
Valor da variável numberP: 0x7ffeefbff488
Endereço da variável numberP: 0x7ffeefbff480
Valor da variável numberPP: 0x7ffeefbff480
Valor de *numberPP: 0x7ffeefbff488
Valor de **numberPP: 10
```

# Níveis entre ponteiros

Portanto podemos criar níveis entre os ponteiros. Assim como podemos representar um vetor com um ponteiro, podemos representar uma matriz com o ponteiro duplo.

Tomemos como exemplo a seguinte declaração de uma variável matriz:

int **matriz = (int **) malloc(sizeof(int *) * 2;

Temos aqui um **vetor** **de** **ponteiros de int** com 2 posições. Por isso a variável matriz é um ponteiro duplo, ela aponta para outro ponteiro.

Se fizermos:

```c
for (i = 0; i < 2; i++)
*(matriz+i) = (int *) malloc(sizeof(int) * 2);
```

Estamos criando para cada posição de matriz, um ponteiro para um **vetor de int** de 2 posições. Portanto, temos uma matriz 2×2.

Quer dizer que se fizermos:

```c
*(*(matriz+0)+0) = 1;
*(*(matriz+0)+1) = 2;
*(*(matriz+1)+0) = 3;
*(*(matriz+1)+1) = 4;
```

É a mesma coisa que fazer:

```c
matriz[0][0] = 1;
matriz[0][1] = 2;
matriz[1][0] = 3;
matriz[1][1] = 4;
```

Tecnicamente minha memória ficou organizada como segue:

| Endereço       | Variável | Conteúdo       |
| -------------- | -------- | -------------- |
| 0x7ffeefbff480 | matriz   | 0x7ffeefbff484 |
| 0x7ffeefbff484 |          | 0x7ffeefbff48c |
| 0x7ffeefbff488 |          | 0x7ffeefbff494 |
| 0x7ffeefbff48c |          | 1              |
| 0x7ffeefbff490 |          | 2              |
| 0x7ffeefbff494 |          | 3              |
| 0x7ffeefbff498 |          | 4              |

## Código Completo

```c
#include <stdio.h>
#include <stdlib.h>

#define TAMANHO 2

int i;
int **matriz;

int main() {
    matriz = (int **) malloc(sizeof(int *) * TAMANHO);
    if (matriz == NULL) {
        printf("Erro ao alocar memória");

    free(matriz);
    }

    for (i = 0; i < TAMANHO; i++) {
        *(matriz+i) = (int *) malloc(TAMANHO * sizeof(int));
        if (*(matriz+i) == NULL) {
            printf("Erro ao alocar memória");
            free(matriz);
        }
    }

    *(*(matriz+0)+0) = 1;
    *(*(matriz+0)+1) = 2;
    *(*(matriz+1)+0) = 3;
    *(*(matriz+1)+1) = 4;

    printf("%d %d\n", matriz[0][0], matriz[0][1]);
    printf("%d %d\n", matriz[1][0], matriz[1][1]);

    free(matriz);

    return EXIT_SUCCESS;
}
```

# Passagem de variáveis de ponteiros por referência

Outro uso muito comum de um ponteiro de ponteiro é a passagem de variáveis que são ponteiros por referência.

## Como assim?

Imagine o seguinte exemplo:

```c
#include <stdio.h>
#include <stdlib.h>

void calculaPi(float *pi) {
    pi = (float *) malloc(sizeof(float));
    *pi = 3.1415;
}

int main() {
    float *pi = NULL;
    calculaPi(pi);
    printf("Valor de pi: %p\n", pi);

    return EXIT_SUCCESS;
}
```

```shell
Valor de pi: 0x0
```

Perceba que o valor da variável `pi` em `main` continua valendo **NULL** (**0x0**).

Isso porque o que foi passado como parâmetro foi o **valor de pi** que era **NULL**, ou seja, a função `calculaPi` **não conhece o endereço da variável** `pi` em `main` para que possa alterá-la de NULL para o novo endereço (malloc realizado em calculaPi).

Para que o exemplo execute corretamente, a função `calculaPi` precisa receber o endereço da variável `pi` em `main`, que é um ponteiro. Portanto, precisamos de um ponteiro de ponteiro em `calculaPi`. Vamos corrigir o exemplo:

```c
#include <stdio.h>
#include <stdlib.h>
void calculaPi(float **pi) {
  *pi = (float *) malloc(sizeof(float));
  **pi = 3.1415;
}

int main() {
  float *pi = NULL;
  calculaPi(&pi);
  printf("Valor de pi: %p\n", pi);
  printf("Valor do conteúdo apontado por pi: %.4f\n", *pi);

  return EXIT_SUCCESS;
}
```

```shell
Valor de pi: 0x1020035a0
Valor do conteúdo apontado por pi: 3.1415
```

Agora sim, perceba que a variável `pi` em `main` possui um endereço de memória válido e que o conteúdo guardado nesse endereço é **3.1415**.

Perceba que as modificações foram:

- O **parâmetro** em `calculaPi` é um **ponteiro duplo** (`**pi`) agora;
- Em `main` passamos o **endereço de pi** (`&pi`) para `calculaPi`.

Ou seja, na função `calculaPi` quando fazemos:

- `*pi`, estamos acessando o endereço da variável **pi** em **main**;
- `**pi`, estamos acessando o conteúdo apontado pela variável **pi** em **main**.

# 3, 4, 5, … N níveis

Por fim temos que dizer que os níveis podem crescer conforme a necessidade. Quero dizer que é possível ter uma estrutura como:

```c
float ***ppp; //ponteiro de ponteiro de ponteiro
float ****pppp; //ponteiro de ponteiro de ponteiro de ponteiro
... //ponteiro de ponteiro de ponteiro de ponteiro ...
```

Na prática, provavelmente, você se deparará apenas com ponteiros de até 2 níveis.
