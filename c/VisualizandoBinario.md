# Visualizando arquivos binários

Todos os arquivos em computadores são armazenados em formato binário (1's e 0's). Imagens, texto, áudio, programas, etc.

A única diferença é que eles são interpretados de forma diferente dependendo do aplicativo que realiza a leitura.

Quando você visualiza um arquivo de texto usando `cat`, o programa lê todos os bits e os apresenta a você convertendo-os em caracteres do alfabeto ou idioma relevante.

Quando você visualiza um arquivo usando um visualizador de imagens, ele pega todos os bits e os transforma em uma imagem.

As ferramentas a seguir permitem visualizar esses arquivos de maneiras diferentes, como octal, hexadecimal ou mesmo binário.

Para hexadecimal:

```bash
hexdump -C arquivo
```

ou

```bash
xxd arquivo
```

ou

```bash
vim arquivo
:% !xxd
```

Se quiser ver no formato binário:

```bash
xxd -b arquivo
```

Octal:

```bash
od arquivo
```

A leitura é muito difícil, se você quiser entender o que um arquivo binário executável faz, é melhor visualizá-lo de uma maneira que mostre a linguagem assembly:

```bash
objdump -d arquivo_executável
```

O `objdump` é um disassembler, ele lê o conteúdo binário e converte seu conteúdo de volta para a linguagem de montagem.

O comando `strings` do Linux imprime as strings de caracteres imprimíveis do arquivo, o que pode facilitar a leitura:

```bash
strings arquivo
```

Se quiser editar o arquivo você pode usar:

```bash
bvi arquivo
```

Ou a extensão Hex Editor do VSCode. Selecione o arquivo binário, pressione `CTRL+E` e digite `> Hex Editor: Open` .

# Tabela ASCII

| Caracter | Dec  | Oct  | Hex  |
| -------- | ---- | ---- | ---- |
| (nul)    | 0    | 0000 | 0x00 |
| (soh)    | 1    | 0001 | 0x01 |
| (stx)    | 2    | 0002 | 0x02 |
| (etx)    | 3    | 0003 | 0x03 |
| (eot)    | 4    | 0004 | 0x04 |
| (enq)    | 5    | 0005 | 0x05 |
| (ack)    | 6    | 0006 | 0x06 |
| (bel)    | 7    | 0007 | 0x07 |
| (bs)     | 8    | 0010 | 0x08 |
| (ht)     | 9    | 0011 | 0x09 |
| (nl)     | 10   | 0012 | 0x0a |
| (vt)     | 11   | 0013 | 0x0b |
| (np)     | 12   | 0014 | 0x0c |
| (cr)     | 13   | 0015 | 0x0d |
| (so)     | 14   | 0016 | 0x0e |
| (si)     | 15   | 0017 | 0x0f |
| (dle)    | 16   | 0020 | 0x10 |
| (dc1)    | 17   | 0021 | 0x11 |
| (dc2)    | 18   | 0022 | 0x12 |
| (dc3)    | 19   | 0023 | 0x13 |
| (dc4)    | 20   | 0024 | 0x14 |
| (nak)    | 21   | 0025 | 0x15 |
| (syn)    | 22   | 0026 | 0x16 |
| (etb)    | 23   | 0027 | 0x17 |
| (can)    | 24   | 0030 | 0x18 |
| (em)     | 25   | 0031 | 0x19 |
| (sub)    | 26   | 0032 | 0x1a |
| (esc)    | 27   | 0033 | 0x1b |
| (fs)     | 28   | 0034 | 0x1c |
| (gs)     | 29   | 0035 | 0x1d |
| (rs)     | 30   | 0036 | 0x1e |
| (us)     | 31   | 0037 | 0x1f |
| (space)  | 32   | 0040 | 0x20 |
| !        | 33   | 0041 | 0x21 |
| "        | 34   | 0042 | 0x22 |
| #        | 35   | 0043 | 0x23 |
| $        | 36   | 0044 | 0x24 |
| %        | 37   | 0045 | 0x25 |
| &        | 38   | 0046 | 0x26 |
| '        | 39   | 0047 | 0x27 |
| (        | 40   | 0050 | 0x28 |
| )        | 41   | 0051 | 0x29 |
| *        | 42   | 0052 | 0x2a |
| +        | 43   | 0053 | 0x2b |
| ,        | 44   | 0054 | 0x2c |
| -        | 45   | 0055 | 0x2d |
| .        | 46   | 0056 | 0x2e |
| /        | 47   | 0057 | 0x2f |
| 0        | 48   | 0060 | 0x30 |
| 1        | 49   | 0061 | 0x31 |
| 2        | 50   | 0062 | 0x32 |
| 3        | 51   | 0063 | 0x33 |
| 4        | 52   | 0064 | 0x34 |
| 5        | 53   | 0065 | 0x35 |
| 6        | 54   | 0066 | 0x36 |
| 7        | 55   | 0067 | 0x37 |
| 8        | 56   | 0070 | 0x38 |
| 9        | 57   | 0071 | 0x39 |
| :        | 58   | 0072 | 0x3a |
| ;        | 59   | 0073 | 0x3b |
| <        | 60   | 0074 | 0x3c |
| =        | 61   | 0075 | 0x3d |
| >        | 62   | 0076 | 0x3e |
| ?        | 63   | 0077 | 0x3f |
| @        | 64   | 0100 | 0x40 |
| A        | 65   | 0101 | 0x41 |
| B        | 66   | 0102 | 0x42 |
| C        | 67   | 0103 | 0x43 |
| D        | 68   | 0104 | 0x44 |
| E        | 69   | 0105 | 0x45 |
| F        | 70   | 0106 | 0x46 |
| G        | 71   | 0107 | 0x47 |
| H        | 72   | 0110 | 0x48 |
| I        | 73   | 0111 | 0x49 |
| J        | 74   | 0112 | 0x4a |
| K        | 75   | 0113 | 0x4b |
| L        | 76   | 0114 | 0x4c |
| M        | 77   | 0115 | 0x4d |
| N        | 78   | 0116 | 0x4e |
| O        | 79   | 0117 | 0x4f |
| P        | 80   | 0120 | 0x50 |
| Q        | 81   | 0121 | 0x51 |
| R        | 82   | 0122 | 0x52 |
| S        | 83   | 0123 | 0x53 |
| T        | 84   | 0124 | 0x54 |
| U        | 85   | 0125 | 0x55 |
| V        | 86   | 0126 | 0x56 |
| W        | 87   | 0127 | 0x57 |
| X        | 88   | 0130 | 0x58 |
| Y        | 89   | 0131 | 0x59 |
| Z        | 90   | 0132 | 0x5a |
| [        | 91   | 0133 | 0x5b |
| \        | 92   | 0134 | 0x5c |
| ]        | 93   | 0135 | 0x5d |
| ^        | 94   | 0136 | 0x5e |
| _        | 95   | 0137 | 0x5f |
| `        | 96   | 0140 | 0x60 |
| a        | 97   | 0141 | 0x61 |
| b        | 98   | 0142 | 0x62 |
| c        | 99   | 0143 | 0x63 |
| d        | 100  | 0144 | 0x64 |
| e        | 101  | 0145 | 0x65 |
| f        | 102  | 0146 | 0x66 |
| g        | 103  | 0147 | 0x67 |
| h        | 104  | 0150 | 0x68 |
| i        | 105  | 0151 | 0x69 |
| j        | 106  | 0152 | 0x6a |
| k        | 107  | 0153 | 0x6b |
| l        | 108  | 0154 | 0x6c |
| m        | 109  | 0155 | 0x6d |
| n        | 110  | 0156 | 0x6e |
| o        | 111  | 0157 | 0x6f |
| p        | 112  | 0160 | 0x70 |
| q        | 113  | 0161 | 0x71 |
| r        | 114  | 0162 | 0x72 |
| s        | 115  | 0163 | 0x73 |
| t        | 116  | 0164 | 0x74 |
| u        | 117  | 0165 | 0x75 |
| v        | 118  | 0166 | 0x76 |
| w        | 119  | 0167 | 0x77 |
| x        | 120  | 0170 | 0x78 |
| y        | 121  | 0171 | 0x79 |
| z        | 122  | 0172 | 0x7a |
| {        | 123  | 0173 | 0x7b |
| \|       | 124  | 0174 | 0x7c |
| }        | 125  | 0175 | 0x7d |
| ~        | 126  | 0176 | 0x7e |
| (del)    | 127  | 0177 | 0x7f |
| Ç        | 128  | 0200 | 0x80 |
| ü        | 129  | 0201 | 0x81 |
| é        | 130  | 0202 | 0x82 |
| â        | 131  | 0203 | 0x83 |
| ä        | 132  | 0204 | 0x84 |
| à        | 133  | 0205 | 0x85 |
| å        | 134  | 0206 | 0x86 |
| ç        | 135  | 0207 | 0x87 |
| ê        | 136  | 0210 | 0x88 |
| ë        | 137  | 0211 | 0x89 |
| è        | 138  | 0212 | 0x8a |
| ï        | 139  | 0213 | 0x8b |
| î        | 140  | 0214 | 0x8c |
| ì        | 141  | 0215 | 0x8d |
| Ä        | 142  | 0216 | 0x8e |
| Å        | 143  | 0217 | 0x8f |
| É        | 144  | 0220 | 0x90 |
| æ        | 145  | 0221 | 0x91 |
| Æ        | 146  | 0222 | 0x92 |
| ô        | 147  | 0223 | 0x93 |
| ö        | 148  | 0224 | 0x94 |
| ò        | 149  | 0225 | 0x95 |
| û        | 150  | 0226 | 0x96 |
| ù        | 151  | 0227 | 0x97 |
| ÿ        | 152  | 0230 | 0x98 |
| Ö        | 153  | 0231 | 0x99 |
| Ü        | 154  | 0232 | 0x9a |
| ø        | 155  | 0233 | 0x9b |
| £        | 156  | 0234 | 0x9c |
| Ø        | 157  | 0235 | 0x9d |
| ×        | 1158 | 0236 | 0x9e |
| ƒ        | 159  | 0237 | 0x9f |
| á        | 160  | 0240 | 0xa0 |
| í        | 161  | 0241 | 0xa1 |
| ó        | 162  | 0242 | 0xa2 |
| ú        | 163  | 0243 | 0xa3 |
| ñ        | 164  | 0244 | 0xa4 |
| Ñ        | 165  | 0245 | 0xa5 |
| ª        | 166  | 0246 | 0xa6 |
| º        | 167  | 0247 | 0xa7 |
| ¿        | 168  | 0250 | 0xa8 |
| ®        | 169  | 0251 | 0xa9 |
| ¬        | 170  | 0252 | 0xaa |
| ½        | 171  | 0253 | 0xab |
| ¼        | 172  | 0254 | 0xac |
| ¡        | 173  | 0255 | 0xad |
| «        | 174  | 0256 | 0xae |
| »        | 175  | 0257 | 0xaf |
| _        | 176  | 0260 | 0xb0 |
| _        | 177  | 0261 | 0xb1 |
| _        | 178  | 0262 | 0xb2 |
| ¦        | 179  | 0263 | 0xb3 |
| ¦        | 180  | 0264 | 0xb4 |
| Á        | 181  | 0265 | 0xb5 |
| Â        | 192  | 0266 | 0xb6 |
| À        | 183  | 0267 | 0xb7 |
| ©        | 184  | 0270 | 0xb8 |
| ¦        | 185  | 0271 | 0xb9 |
| ¦        | 186  | 0272 | 0xba |
| +        | 187  | 0273 | 0xbb |
| +        | 188  | 0274 | 0xbc |
| ¢        | 189  | 0275 | 0xbd |
| ¥        | 190  | 0276 | 0xbe |
| +        | 191  | 0277 | 0xbf |
| +        | 192  | 0300 | 0xc0 |
| -        | 193  | 0301 | 0xc1 |
| -        | 194  | 0302 | 0xc2 |
| +        | 195  | 0303 | 0xc3 |
| -        | 196  | 0304 | 0xc4 |
| +        | 197  | 0305 | 0xc5 |
| ã        | 198  | 0306 | 0xc6 |
| Ã        | 199  | 0307 | 0xc7 |
| +        | 200  | 0310 | 0xc8 |
| +        | 201  | 0311 | 0xc9 |
| -        | 202  | 0312 | 0xca |
| -        | 203  | 0313 | 0xcb |
| ¦        | 204  | 0314 | 0xcc |
| -        | 205  | 0315 | 0xcd |
| +        | 206  | 0316 | 0xce |
| ¤        | 207  | 0317 | 0xcf |
| ð        | 208  | 0320 | 0xd0 |
| Ð        | 209  | 0321 | 0xd1 |
| Ê        | 210  | 0322 | 0xd2 |
| Ë        | 211  | 0323 | 0xd3 |
| È        | 212  | 0324 | 0xd4 |
| i        | 213  | 0325 | 0xd5 |
| Í        | 214  | 0326 | 0xd6 |
| Î        | 215  | 0327 | 0xd7 |
| Ï        | 216  | 0330 | 0xd8 |
| +        | 217  | 0331 | 0xd9 |
| +        | 218  | 0332 | 0xda |
| _        | 219  | 0333 | 0xdb |
| _        | 220  | 0334 | 0xdc |
| ¦        | 221  | 0335 | 0xdd |
| Ì        | 222  | 0336 | 0xde |
| _        | 223  | 0337 | 0xdf |
| Ó        | 224  | 0340 | 0xe0 |
| ß        | 225  | 0341 | 0xe1 |
| Ô        | 226  | 0342 | 0xe2 |
| Ò        | 227  | 0343 | 0xe3 |
| Õ        | 228  | 0344 | 0xe4 |
| Õ        | 229  | 0345 | 0xe5 |
| µ        | 230  | 0346 | 0xe6 |
| Þ        | 231  | 0347 | 0xe7 |
| Þ        | 232  | 0350 | 0xe8 |
| Ú        | 233  | 0351 | 0xe9 |
| Û        | 234  | 0352 | 0xea |
| Ù        | 235  | 0353 | 0xeb |
| ý        | 236  | 0354 | 0xec |
| Ý        | 237  | 0355 | 0xed |
| ¯        | 238  | 0356 | 0xee |
| ´        | 239  | 0357 | 0xef |
|          | 240  | 0360 | 0xf0 |
| ±        | 241  | 0361 | 0xf1 |
| _        | 242  | 0362 | 0xf2 |
| ¾        | 243  | 0363 | 0xf3 |
| ¶        | 244  | 0364 | 0xf4 |
| §        | 245  | 0365 | 0xf5 |
| ÷        | 24   | 0366 | 0xf6 |
| ¸        | 247  | 0367 | 0xf7 |
| °        | 248  | 0370 | 0xf8 |
| ¨        | 249  | 0371 | 0xf9 |
| ·        | 250  | 0372 | 0xfa |
| ¹        | 251  | 0373 | 0xfb |
| ³        | 252  | 0374 | 0xfc |
| ²        | 253  | 0375 | 0xfd |
| _        | 254  | 0376 | 0xfe |
|          | 255  | 0377 | 0xff |

| Nome ASCII | Descrição       | Representação em C |
| ---------- | --------------- | ------------------ |
| nul        | null byte       | \0                 |
| bel        | bell character  | \a                 |
| bs         | backspace       | \b                 |
| ht         | horizontal tab  | \t                 |
| np         | formfeed        | \f                 |
| nl         | newline         | \n                 |
| cr         | carriage return | \r                 |
| vt         | vertical tab    |                    |
| esc        | escape          |                    |
| sp         | space           |                    |
