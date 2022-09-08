# O que é?

Uma Lista Simplesmente Ligada (*LinkedList*) é uma estrutura de dados alocada **dinamicamente**, cuja navegação ocorre em um único sentido (**unidirecional**).

Trata-se de uma estrutura muito utilizada para implementação de **Pilha** e **Fila**, visto que, são estruturas cujo acesso não é indexado e ocorrem sequencialmente.

# Pré-requisito

Para que você possa compreender a implementação da biblioteca, faz-se necessário que você saiba como utilizar ponteiros. Veja os artigos abaixo sobre o assunto caso não saiba ou queira relembrar:

- [Ponteiros em C]();
- [Ponteiro Duplo em C]().

# Biblioteca

Iremos criar uma biblioteca de Lista Simplesmente Ligada (`LinkedList.h`) que atenda tanto pilhas como filas ou para ser simplesmente utilizada como se fosse uma lista indexada.

As operações a serem implementadas para suportar o conceito de **Fila** serão:

- `enqueue`: insere no final da fila;
- `dequeue`: remove do início da fila;
- `first`: consulta quem é o primeiro da fila;
- `last`: consulta quem é o último da fila;
- `isEmpty`: verifica se a fila está vazia.

Já as operações para suportar o conceito de **Pilha** serão:

- `push`: insere no topo da pilha;
- `pop`: remove do topo da pilha;
- `top`: consulta o topo da pilha;

E as operações que nos darão a flexibilidade de utilizar nossa estrutura dinâmica como se fosse **indexada** serão:

- `add`: adiciona em qualquer posição;
- `addAll`: adiciona vários elementos a partir de qualquer posição;
- `getPos`: busca o elemento em uma posição específica;
- `indexOf`: descobre a posição de um elemento específico;
- `removePos`: remove o elemento de uma determinada posição;
- `removeData`: remove determinado dado da lista.

## LinkedList.h

Abaixo podemos ver o arquivo `LinkedList.h` proposto:

```c
#ifndef DataStructure_LinkedList_h
#define DataStructure_LinkedList_h
#include <stdbool.h>

typedef struct Node {
  void *data;
  struct Node *next;
}Node;

typedef struct LinkedList {
  Node *first;
  int size;
}LinkedList;

typedef bool (*compare)(void*,void*);

void init(LinkedList *list);
int enqueue(LinkedList *list, void *data);
void* dequeue(LinkedList *list);
void* first(LinkedList *list);
void* last(LinkedList *list);
int push(LinkedList *list, void *data);
void* pop(LinkedList *list);
void* top(LinkedList *list);
bool isEmpty(LinkedList *list);
int indexOf(LinkedList *list, void *data, compare equal);
void* getPos(LinkedList *list, int pos);
Node* getNodeByPos(LinkedList *list, int pos);
int add(LinkedList *list, int pos, void *data);
int addAll(LinkedList *listDest, int pos, LinkedList *listSource);
void* removePos(LinkedList *list, int pos);
bool removeData(LinkedList *list, void *data, compare equal);

#endif
```

A estrutura em memória deverá se parecer com algo do tipo:

![](https://i1.wp.com/www.jppreti.com/wp-content/uploads/2019/06/Captura-de-Tela-2019-06-17-a%CC%80s-21.55.36.png?fit=750%2C127)

## LinkedList.c

### init

O procedimento `init` tem por responsabilidade inicializar a estrutura da nossa `LinkedList`, ou seja, inicializar as variáveis `first` e `size` da estrutura.

Veja a implementação abaixo:

```c
void init(LinkedList *list) {
  list->first=NULL;
  list->size=0;
}
```

Perceba que basicamente estamos garantindo que `first` não esteja apontando para nenhum endereço de memória válido e que a quantidade de elementos da lista é zero. O resultado esperado é algo do tipo:

![](https://i0.wp.com/www.jppreti.com/wp-content/uploads/2019/06/Captura-de-Tela-2019-06-20-a%CC%80s-13.18.29.png?resize=215%2C73)

### isEmpty

O objetivo aqui é verificar se nossa lista está vazia, ou seja, não aponta para nenhum elemento (`first == NULL`) ou possui tamanho zero (`size == 0`).

```c
bool isEmpty(LinkedList *list) {
  return (list->size == 0);
}
```

Neste caso optamos por retornar a comparação de `size` com zero (`0`), mas poderia muito bem ser o retorno da comparação de `first` com `NULL`.

### enqueue

Vamos implementar agora a inserção de um novo elemento respeitando o conceito de fila, ou seja, novos elementos deverão ser inseridos ao final da lista.

O primeiro passo consiste em reservar um espaço novo na memória suficientemente grande para caber um nó da lista (`Node`).

```c
Node *newNode = (Node*)malloc(sizeof(Node));
```

Caso não haja espaço suficiente na memória precisamos informar o usuário, neste caso opamos por retornar o valor negativo `-1`.

```c
if (newNode==NULL) return -1;
```

Depois inicializamos as variáveis do novo nó. Perceba que `next` recebe `NULL` porque o nó que será inserido será o último da lista, portanto, sem próximo.

```c
newNode->data = data;
newNode->next = NULL;
```

Agora que o nó está pronto para ser inserido precisamos descobrir aonde devemos inseri-lo. Se a lista estiver vazia ele será o primeiro elemento da lista.

```c
if (isEmpty(list))
  list->first = newNode;
```

Mas caso a lista não esteja vazia, precisaremos descobrir quem é o último, para que então possamos inserir depois deste.

```c
...
else {
  Node *aux = list->first; //aux aponta para o primeiro
  while (aux->next != NULL) //enquanto não for o último nó
      aux = aux->next; //aux avança para o nó seguinte
  aux->next = newNode; //último nó aponta para o novo nó
}
```

Perceba que criamos uma variável auxiliar (`aux`) que começará apontando para o primeiro da lista (`first`) e avançará até que encontre um nó cujo `next` seja `NULL`, ou seja, é o último elemento da lista.

Ao encontrar esse elemento atualizamos o valor de `next` para o endereço do novo nó (`newNode`).

Agora que o novo nó foi inserido na lista, podemos **incrementar** a quantidade de elementos da lista (`size`) e retornar a quantidade de elementos inseridos (`1`).

```c
list->size++;
return 1;
```

Veja abaixo o código completo de enqueue:

```c
int enqueue(LinkedList *list, void *data) {
  Node *newNode = (Node*)malloc(sizeof(Node));
  if (newNode==NULL) return -1;
  newNode->data = data;
  newNode->next = NULL;
  if (isEmpty(list)) //se a lista estiver vazia
    list->first = newNode; //novo nó é o primeiro
  else {
    Node *aux = list->first; //aux aponta para o primeiro
    while (aux->next != NULL) //enquanto não for o último nó
      aux = aux->next; //aux avança para o nó seguinte
    aux->next = newNode; //último nó aponta para o novo nó
  }
  list->size++;
  return 1;
}
```

### first

Agora que conseguimos inserir em nossa lista, podemos fazer operações para descobrir qual dado é o primeiro da nossa lista.

```c
void* first(LinkedList *list) {
  return (isEmpty(list))?NULL:list->first->data;
}
```

Se a lista estiver vazia (`isEmpty`) retornamos `NULL`, ou seja, não temos o endereço de memória do primeiro elemento, senão retornamos o endereço de memória do dado guardado no primeiro nó (`first->data`)

### last

Para descobrirmos o último elemento da lista precisaremos navegar a partir do primeiro elemento (`first`) até encontrar um nó que não aponte para um próximo elemento `(next==NULL`).

```c
void* last(LinkedList *list) {
  void *data = NULL;
  if (!isEmpty(list)) { //Se a lista não estiver vazia
    Node *aux = list->first; //aux aponta para o primeiro nó
    while (aux->next != NULL) //enquanto não for o último nó
      aux = aux->next; //aux avança para o nó seguinte
    data = aux->data; //endereço de memória do dado no último nó
  }
  return data;
}
```

Perceba que realizamos essa operação em **enqueue** para inserir ao final da lista.

### dequeue

Esta operação consiste em remover o primeiro elemento da nossa lista.

A primeira coisa é verificar se existe algo na lista, senão retornamos `NULL`, ou seja, nada foi removido.

```c
if (isEmpty(list)) return NULL;
```

A lista tendo elementos, precisaremos remover o primeiro elemento e o segundo elemento passará a ser o primeiro elemento:

```c
Node *trash = list->first; //variável que guarda o endereço do nó que será removido
list->first = list->first->next; //primeiro elemento passa a ser o segundo da lista
void *data = trash->data; //dado do nó removido
```

Agora podemos liberar a memória, decrementar a quantidade de elementos e retornar o dado que foi removido.

```c
free(trash);
list->size--;
return data;
```

O código completo podemos ver abaixo:

```c
void* dequeue(LinkedList *list) {
  if (isEmpty(list)) return NULL;
  Node *trash = list->first; //variável que guarda o endereço do nó que será removido
  list->first = list->first->next; //primeiro elemento passa a ser o segundo da lista
  void *data = trash->data; //dado do nó removido
  free(trash);
  list->size--;
  return data;
}
```

Para a implementação das operações de pilha em nossa lista podemos aproveitar as operações de fila. Vejamos como ficarão.

### pop

```c
void* pop(LinkedList *list) {
  return dequeue(list);
}
```

### top

```c
void* top(LinkedList *list) {
  return first(list);
}
```

### push

Perceba que a diferença básica do **push** para o **enqueue** está no `else`. Ao invés de inserir no final da lista, a inserção é feita no início da lista, já que o topo é o início da lista.

```c
int push(LinkedList *list, void *data) {
  Node *newNode = (Node*) malloc(sizeof(Node));
  if (newNode==NULL) return -1;
  newNode->data = data;
  newNode->next = NULL;
  if (isEmpty(list)) //se a lista estiver vazia
    list->first = newNode; //novo nó é o primeiro
  else {
    newNode->next = list->first; //o topo atual será o segundo da lista
    list->first = newNode; //o novo nó será o topo
  }
  list->size++;
  return 1;
}
```

### getNodeByPos

O objetivo aqui é retornar o endereço do nó (Node) localizado em uma determinada posição da lista.

Nossa principal condição de parada é baseada em um simples contador que vai incrementando toda vez que avançamos na lista. Quando o contador é igual a posição desejada retornamos o ponteiro do nó em que estamos posicionados.

Trata-se apenas de uma função auxiliar que será utilizada por outras funções de nossa biblioteca.

```c
Node* getNodeByPos(LinkedList *list, int pos) {
  if (isEmpty(list) || pos>=list->size) return NULL;
  Node *aux = list->first;
  for (int count=0;(aux!=NULL && count<pos);count++,aux=aux->next);
  return aux;
}
```

### getPos

Esta função é basicamente igual a getNodeByPos, a diferença é que retornamos o dado e não o endereço do nó.

```c
void* getPos(LinkedList *list, int pos) {
  Node *aux = getNodeByPos(list,pos);
  if (aux==NULL)
    return NULL;
  else
    return aux->data;
}
```

### add

A função `add` permite a inserção de um único dado em uma determinada posição da lista.

Primeiro iremos verificar se a posição a ser inserida é o início. Se for basta utilizar a função `push` já implementada.

```c
if (pos <= 0) return push(list,data);
```

Em seguida iremos utilizar a função auxiliar `getNodeByPos` para descobrir o nó da posição anterior a posição que queremos inserir (pos-1):

```c
Node *aux = getNodeByPos(list, (pos-1));
if (aux==NULL) return -2;
```

Retornamos -2 para informar que a posição fornecida é inválida. Caso a posição seja válida alocamos um novo espaço na memória para receber o novo nó.

```c
Node *newNode = (Node*) malloc(sizeof(Node));
if (newNode==NULL) return -1; //memória insuficiente
newNode->data = data;
newNode->next = NULL;
```

Podemos agora inserir o novo nó dentro da nossa lista:

```c
newNode->next = aux->next; //Novo nó aponta para a posição seguinte
aux->next = newNode; //posição do auxiliar aponta para o novo nó
```

Perceba que o nó é inserido na posição correta, após (pos-1).

O código completo da operação `add` pode ser visualizado abaixo:

```c
int add(LinkedList *list, int pos, void *data) {
  if (pos <= 0) return push(list,data);
  Node *aux = getNodeByPos(list, (pos-1));
  if (aux==NULL) return -2;
  Node *newNode = (Node*) malloc(sizeof(Node));
  if (newNode==NULL) return -1;
  newNode->data = data;
  newNode->next = NULL;
  newNode->next = aux->next;
  aux->next = newNode;
  list->size++;
  return 1;
}
```

#### addAll

A ideia aqui é poder adicionar uma lista (lista de origem) dentro de outra lista (lista de destino), a partir de uma determinada posição.

Primeiro iremos verificar se essas listas possuem elementos para que faça sentido a inserção de uma em outra.

```c
if (listDest==NULL || isEmpty(listDest)) return -1;
if (listSource==NULL || isEmpty(listSource)) return -2;
```

Em seguida iremos verificar se a posição a ser inserida é o início (`pos==0`). Se for, teremos que atualizar a variável `first` de nosso `struct LinkedList` e o último nó de nossa lista de origem apontará para o nó que era o `first` inicialmente.

```c
Node *last = NULL;
for (last = listSource->first;last->next!=NULL;last=last->next);
if (pos == 0) {
  last->next = listDest->first;
  listDest->first = listSource->first;
}
```

Caso a posição a ser inserida não for a de início, precisaremos localizar o nó anterior a posição desejada.

```c
... else {
  Node *aux = getNodeByPos(listDest, (pos-1));
  if (aux==NULL) return -3;
  last->next = aux->next;
  aux->next = listSource->first;
}
```

Ao final basta incrementarmos a quantidade de elementos da lista de destino com a quantidade de elementos da lista de origem e retornar essa quantidade de elementos novos inseridos.

```c
listDest->size += listSource->size;
return listSource->size;
```

Abaixo podemos ver a implementação completa de `addAll`:

```c
int addAll(LinkedList *listDest, int pos, LinkedList *listSource) {
  if (listDest==NULL || isEmpty(listDest)) return -1;
  if (listSource==NULL || isEmpty(listSource)) return -2;
  Node *last = NULL;
  for (last = listSource->first;last->next!=NULL;last=last->next);
  if (pos == 0) {
    last->next = listDest->first;
    listDest->first = listSource->first;
  } else {
    Node *aux = getNodeByPos(listDest, (pos-1));
    if (aux==NULL) return -3;
    last->next = aux->next;
    aux->next = listSource->first;
  }
  listDest->size+=listSource->size;
  return listSource->size;
}
```

### removePos

Remove um elemento da lista baseado na posição fornecida.

Primeiro devemos verificar se a lista está vazia ou se a posição fornecida é inválida:

```c
if (isEmpty(list) || pos>=list->size) return NULL;
```

Vamos criar 2 variáveis auxiliares, uma que apontará para o nó a ser removido (`nodeRemove`) e outra para guardar o endereço do nó anterior ao nó que será removido (`aux`):

```c
Node *nodeRemove = NULL;
Node *aux = NULL;
```

Agora podemos buscar essa posição que será removida. Se for o primeiro elemento da lista, podemos aproveitar para invocar a função `dequeue` que já implementa a remoção do primeiro, caso contrário deveremos buscar o endereço do nó anterior ao nó que será removido:

```c
if (pos<=0)
  return dequeue(list); //remove o primeiro
else
  aux = getNodeByPos(list, pos-1); //busca o nó anterior
```

Descoberta a posição anterior do nó que será removido, podemos realizar a operação de remoção conforme segue:

```c
nodeRemove = aux->next; //identificamos o nó que será removido (que é o próximo)
aux->next = nodeRemove->next; //fazemos com que o nó anterior aponte para o nó seguinte ao nó que será removido
void* dataRemove = nodeRemove->data; //guardamos uma referência ao dado guardado no nó que será removido
free(nodeRemove); //removemos o nó da memória
list->size--; //decrementamos a quantidade de elementos da lista
return dataRemove; //retornamos apenas o dado
```

Abaixo podemos observar a implementação completa:

```c
void* removePos(LinkedList *list, int pos) {
  if (isEmpty(list) || pos>=list->size) return NULL;
  Node *nodeRemove = NULL;
  Node *aux = NULL;
  if (pos<=0)
    return dequeue(list);
  else
    aux = getNodeByPos(list, pos-1);
  nodeRemove = aux->next;
  aux->next = nodeRemove->next;
  void* dataRemove = nodeRemove->data;
  free(nodeRemove);
  list->size--;
  return dataRemove;
}
```

### indexOf

Retorna a posição (0..N) na lista em que se encontra um determinado dado.

Primeiro verificamos se a lista está vazia, se assim for retornamos -1, identificando uma posição inválida.

```c
if (isEmpty(list)) return -1;
```

Caso a lista não esteja vazia precisamos percorrê-la navegando nos ponteiros e contabilizando as posições. Para isso, criamos uma variável `count` que começa em `0` e `aux` para navegar na lista começando em `list->first`, ou seja, **nossa primeira posição começa em 0 (zero)**.

```c
int count = 0;
Node *aux = list->first;
```

Iremos percorrer essa lista observando duas condições:

- não chegamos ao final da lista (`aux!=NULL`) e;
- ainda não encontramos o dado procurado (`!equal(aux->data,data)`).

```c
while(aux!=NULL && !equal(aux->data,data)) {
  aux=aux->next; //avançamos na lista
  count++; //atualizamos a posição
}
```

Terminado o laço de repetição precisamos saber se ele encerrou porque chegou ao final sem encontrar o dado (`aux==NULL`) ou se terminou porque encontrou o dado (`aux!=NULL`). Caso não tenha encontrado retornamos o valor -1.

```c
return (aux==NULL)?-1:count;
```

Abaixo podemos visualizar a implementação completa de `indexOf`:

```c
int indexOf(LinkedList *list, void *data, compare equal) {
  if (isEmpty(list)) return -1;
  int count=0;
  Node *aux = list->first;
  while(aux!=NULL && !equal(aux->data,data)) {
    aux=aux->next;
    count++;
  }
  return (aux==NULL)?-1:count;
}
```

### removeData

Remove um determinado dado da lista.

Para fazer a remoção de um nó teremos duas situações:

- é o primeiro elemento a ser removido;
- é um elemento de uma posição qualquer diferente da primeira.

Para removermos o primeiro elemento:

```c
Node *nodeRemove = NULL; //nó que será removido
if (equal(list->first->data,data)) { //é o primeiro nó?
  nodeRemove = list->first; //nó a ser removido é o primeiro
  list->first = list->first->next; //segundo nó passa a ser o first
  free(nodeRemove->data); //remoção do dado
  free(nodeRemove); //remoção do nó
  list->size--;
  return true;
}
```

Para removermos qualquer outro elemento:

```c
... else {
  Node *aux = list->first; //começaremos a navegar pelo primeiro nó
  while(aux->next!=NULL && !equal(aux->next->data,data))
    aux=aux->next; //avançando até encontrar o dado ou chegar ao final da lista
  if (aux->next!=NULL) { //se encontrado o nó
    Node *nodeRemove = aux->next; //nó a ser removido é o próximo
    aux->next = nodeRemove->next; //removido da lista
    free(nodeRemove->data); //removido o dado
    free(nodeRemove); //removido o nó
    list->size--;
    return true;
  } else {
    return false; //nó não foi encontrado
  }
}
```

Abaixo temos a implementação completa de `removeData`:

```c
bool removeData(LinkedList *list, void *data, compare equal) {
    if (isEmpty(list)) return -1;

    Node *nodeRemove = NULL;
    if (equal(list->first->data,data)) {
        nodeRemove = list->first;
        list->first = list->first->next;
        free(nodeRemove->data);
        free(nodeRemove);
        list->size--;
        return true;
    } else {
        Node *aux = list->first;
        while(aux->next!=NULL && !equal(aux->next->data,data))
            aux=aux->next;

        if (aux->next!=NULL) {
            Node *nodeRemove = aux->next;
            aux->next = nodeRemove->next;
            free(nodeRemove->data);
            free(nodeRemove);
            list->size--;
            return true;
        } else {
            return false;
        }
    }
}
```

Abaixo podemos ver o código completo da implementação da nossa biblioteca `LinkedList.c`.

```c
#include <stdio.h>
#include <stdlib.h>
#include "LinkedList.h"

void init(LinkedList *list) {
    list->first=NULL;
    list->size=0;
}

int enqueue(LinkedList *list, void *data) {
    Node *newNode = (Node*)malloc(sizeof(Node));
    if (newNode==NULL) return -1;
    newNode->data = data;
    newNode->next = NULL;

    if (isEmpty(list))            //se a lista estiver vazia
        list->first = newNode;    //novo nó é o primeiro
    else {
        Node *aux = list->first;  //aux aponta para o primeiro
        while (aux->next != NULL) //enquanto não for o último nó
            aux = aux->next;      //aux avança para o nó seguinte
        aux->next = newNode;      //último nó aponta para o novo nó
    }

    list->size++;
    return 1;
}

void* dequeue(LinkedList *list) {
    if (isEmpty(list)) return NULL;

    Node *trash = list->first;
    list->first = list->first->next;

    void *data = trash->data;
    free(trash);
    list->size--;

    return data;
}

void* first(LinkedList *list) {
    return (isEmpty(list))?NULL:list->first->data;
}

void* last(LinkedList *list) {
    void *data = NULL;
    if (!isEmpty(list)) {          //Se a lista não estiver vazia
        Node *aux = list->first;   //aux aponta para o primeiro nó
        while (aux->next != NULL)  //enquanto não for o último nó
            aux = aux->next;       //aux avança para o nó seguinte
        data = aux->data;          //endereço de memória do dado no último nó
    }
    return data;
}

int push(LinkedList *list, void *data) {
    Node *newNode = (Node*) malloc(sizeof(Node));
    if (newNode==NULL) return -1;
    newNode->data = data;
    newNode->next = NULL;

    if (isEmpty(list))               //se a lista estiver vazia
        list->first = newNode;       //novo nó é o primeiro
    else {
        newNode->next = list->first; //o topo atual será o segundo da lista
        list->first = newNode;       //o novo nó será o topo
    }

    list->size++;
    return 1;
}

void* pop(LinkedList *list) {
    return dequeue(list);
}

void* top(LinkedList *list) {
    return first(list);
}

bool isEmpty(LinkedList *list) {
    return (list->size==0);
}

int indexOf(LinkedList *list, void *data, compare equal) {
    if (isEmpty(list)) return -1;
    int count=0;
    Node *aux = list->first;

    while(aux!=NULL && !equal(aux->data,data)) {
        aux=aux->next;
        count++;
    }

    return (aux==NULL)?-1:count;
}

Node* getNodeByPos(LinkedList *list, int pos) {
    if (isEmpty(list) || pos>=list->size) return NULL;

    Node *aux = list->first;

    for (int count=0;(aux!=NULL && count<pos);count++,aux=aux->next);
    return aux;
}

void* getPos(LinkedList *list, int pos) {
    Node *aux = getNodeByPos(list,pos);
    if (aux==NULL) 
        return NULL;
    else
        return aux->data;
}

int add(LinkedList *list, int pos, void *data) {
    if (pos <= 0) return push(list,data);

    Node *aux = getNodeByPos(list, (pos-1));
    if (aux==NULL) return -2;

    Node *newNode = (Node*) malloc(sizeof(Node));
    if (newNode==NULL) return -1;

    newNode->data = data;
    newNode->next = NULL;

    newNode->next = aux->next;
    aux->next = newNode;

    list->size++;

    return 1;
}

int addAll(LinkedList *listDest, int pos, LinkedList *listSource) {
    if (listDest==NULL || isEmpty(listDest)) return -1;
    if (listSource==NULL || isEmpty(listSource)) return -2;

    Node *last = NULL;
    for (last = listSource->first;last->next!=NULL;last=last->next);
    if (pos == 0) {
        last->next = listDest->first;
        listDest->first = listSource->first;
    } else {
        Node *aux = getNodeByPos(listDest, (pos-1));
        if (aux==NULL) return -3;        
        last->next = aux->next; 
        aux->next = listSource->first;
    }
    listDest->size+=listSource->size;
    return listSource->size;
}

void* removePos(LinkedList *list, int pos) {
    if (isEmpty(list) || pos>=list->size) return NULL;

    Node *nodeRemove = NULL;
    Node *aux = NULL;

    if (pos<=0)
        return dequeue(list);
    else
        aux = getNodeByPos(list, pos-1);

    nodeRemove = aux->next;
    aux->next = nodeRemove->next;

    void* dataRemove = nodeRemove->data;
    free(nodeRemove);
    list->size--;

    return dataRemove;
}

bool removeData(LinkedList *list, void *data, compare equal) {
    if (isEmpty(list)) return -1;

    Node *nodeRemove = NULL;
    if (equal(list->first->data,data)) {
        nodeRemove = list->first;
        list->first = list->first->next;
        free(nodeRemove->data);
        free(nodeRemove);
        list->size--;
        return true;
    } else {
        Node *aux = list->first;
        while(aux->next!=NULL && !equal(aux->next->data,data))
            aux=aux->next;

        if (aux->next!=NULL) {
            Node *nodeRemove = aux->next;
            aux->next = nodeRemove->next;
            free(nodeRemove->data);
            free(nodeRemove);
            list->size--;
            return true;
        } else {
            return false;
        }
    }
}
```

# LinkedListTest.c

Abaixo criamos um programa para testar a nossa biblioteca.

```c
#include <stdlib.h>
#include <stdio.h>
#include "LinkedList.h"

bool compara(void *data1, void *data2) {
    int *d1 = (int*)data1;
    int *d2 = (int*)data2;

    return (*d1==*d2)?true:false;
}

int main() {
    LinkedList list;
    init(&list);

    int *aux = (int *)malloc(sizeof(int));
    *aux=1;
    enqueue(&list, aux);
    aux = (int *)malloc(sizeof(int));
    *aux=2;
    enqueue(&list, aux);
    aux = (int *)malloc(sizeof(int));
    *aux=3;
    enqueue(&list, aux);

    printf("%d\n",*((int*)first(&list)));
    printf("%d\n",indexOf(&list,aux,compara));
    printf("%d\n",*((int*)getPos(&list,2)));
    printf("%d\n",*((int*)dequeue(&list)));
    printf("%d\n",*((int*)dequeue(&list)));
    printf("%d\n",*((int*)dequeue(&list)));
    //printf("%d\n",*((int*)dequeue(&stack)));

    return EXIT_SUCCESS;
}
```
