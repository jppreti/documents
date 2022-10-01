Como proposta de exercício segue abaixo a estrutura para armazenamento de palavras que possibilitem agilizar a identificação de suas variantes.

Essa estrutura permite a realização de uma função bastante comum como o autocompletar, que vai sugerindo palavras de acordo com a digitação do usuário.

Veja a figura abaixo:

![Estrutura de Dados do Autocomplete](https://github.com/jppreti/documents/blob/main/c/datastructure/images/Autocomplete.png?raw=true)

Perceba que todas as palavras abaixo estão representadas na estrutura:

| Palavra  | Qtde |            |
| -------- | ---- | ---------- |
| A        | 1    |            |
| ABA      | 3    |            |
| ABACATE  | 7    |            |
| ABACAXI  | 7    |            |
| ABELARDO | 8    |            |
| ABELHA   | 6    |            |
| BACIA    | 5    |            |
| BAIA     | 5    |            |
| BAIANO   | 6    |            |
| BANHO    | 5    |            |
| BANHEI   | 6    |            |
| BANHEIRO | 8    |            |
|          | 79   | caracteres |

A ideia do exercício é que você implemente 2 operações:

- `add`: adiciona uma palavra (passada como parâmetro) dentro da estrutura proposta;
- `show`: que exibe todas as derivações da palavra passada como parâmetro.

Para facilitar a implementação, vamos partir do princípio que as palavras passadas para o add serão fornecidas já em ordem alfabética.
