// Guia_1505.txt
// 813168 - Arthur Martinho Medeiros Oliveira
//
// Calcular dado03 = dado01 * 4 + dado02 / 2
// Usar deslocamentos/rotações
//

LXI H, dado01 ; HL <- addr(dado01) ; endereco do dado01
MOV A, M ; A <- MEM [HL] ; A = MEM [dado01]

DAD H ; HL <- HL + HL ; HL = 2 * dado01
DAD H ; HL <- HL + HL ; HL = 4 * dado01

LXI H, dado02 ; HL <- addr(dado02) ; endereco do dado02
MOV B, M ; B <- MEM [HL] ; B = MEM [dado02]

RRC ; rotacionar A e o bit de carry à direita
RRC ; rotacionar A e o bit de carry à direita
RRC ; rotacionar A e o bit de carry à direita
RRC ; rotacionar A e o bit de carry à direita

ADD B ; A <- A + B ; A = dado01 * 4 + dado02 / 2

STA dado03 ; MEM [dado03] <- A ; MEM [dado03] = dado01 * 4 + dado02 / 2
HLT ; halt ; parar

// Area de dados
dado01: 03 ; primeiro dado em hexadecimal (8 bits)
dado02: 06 ; segundo dado em hexadecimal (8 bits)
dado03: 00 ; resultado em hexadecimal (8 bits)
