// Guia_1504.txt
// 813168 - Arthur Martinho Medeiros Oliveira
//
// Calcular dado03 = 4 * (dado01 - 2 * dado02)
//

LXI H, dado02 ; HL <- addr(dado02) ; endereco do dado02
MOV B, M ; B <- MEM [HL] ; B = MEM [dado02] (dado02)

DAD B ; HL <- HL + HL ; HL = 2 * dado02
MOV B, H ; B <- H ; B = parte alta de 2 * dado02

LXI H, dado01 ; HL <- addr(dado01) ; endereco do dado01
MOV A, M ; A <- MEM [HL] ; A = MEM [dado01]

SUB B ; A <- A - B ; A = dado01 - 2 * dado02

MOV C, A ; C <- A ; C = resultado da subtracao

MOV A, C ; A <- C ; A = resultado da subtracao
DAD C ; HL <- HL + HL + CY ; HL = 4 * (dado01 - 2 * dado02)
DAD C ; HL <- HL + HL + CY ; HL = 4 * (dado01 - 2 * dado02) + 2 * (dado01 - 2 * dado02)

MOV C, A ; C <- A ; C = resultado da multiplicacao

STA dado03 ; MEM [dado03] <- C ; MEM [dado03] = 4 * (dado01 - 2 * dado02)
HLT ; halt ; parar

// Area de dados
dado01: 12 ; primeiro dado em hexadecimal (8 bits)
dado02: 05 ; segundo dado em hexadecimal (8 bits)
dado03: 00 ; resultado em hexadecimal (8 bits)
