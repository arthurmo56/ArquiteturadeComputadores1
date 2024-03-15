// Guia_1503.txt
// 813168 - Arthur Martinho Medeiros Oliveira
//
// Calcular dado04 = dado01 - dado02 - dado03 em BCD
// Se a subtracao resultar em um numero negativo, converter para BCD
//

LXI H, dado01 ; HL <- addr(dado01) ; endereco do dado01
MOV A, M ; A <- MEM [HL] ; A = MEM [dado01]
INX H ; HL <- HL+1 ; endereco do dado02
MOV B, M ; B <- MEM [HL] ; B = MEM [dado02]

SUB B ; A <- A - B ; A = dado01 - dado02

MOV C, A ; C <- A ; C = resultado da subtracao

LXI H, dado03 ; HL <- addr(dado03) ; endereco do dado03
MOV A, M ; A <- MEM [HL] ; A = MEM [dado03]

SUB C ; A <- A - C ; A = dado03 - (dado01 - dado02)

STA dado04 ; MEM [dado04] <- A ; MEM [dado04] = dado04

; Converter para BCD se necessário
MOV C, A ; C <- A ; C = resultado da subtracao

MVI B, 0AH ; B <- 0AH ; B = 10

CMP B ; A <- A - B ; verificar se o resultado é negativo
JC converte_para_BCD ; se JC, o resultado é negativo, converter para BCD

HLT ; halt ; parar

converte_para_BCD: ; Sub-rotina para converter para BCD
MOV A, C ; A <- C ; A = resultado da subtracao

ANI 0FH ; A <- A AND 0FH ; manter apenas os 4 bits menos significativos
MOV C, A ; C <- A ; C = 4 bits menos significativos

MOV A, B ; A <- B ; A = 10
SUI 0AH ; A <- A - 0AH ; A = 10 - 10 = 0
MOV B, A ; B <- A ; B = 0

ADI 30H ; A <- A + 30H ; A = A + 30H = 30H
MOV A, C ; A <- C ; A = 4 bits menos significativos convertidos para BCD
STA dado04 ; MEM [dado04] <- A ; MEM [dado04] = dado04

HLT ; halt ; parar

// Area de dados
dado01: 12 ; primeiro dado em BCD
dado02: 09 ; segundo dado em BCD
dado03: 05 ; terceiro dado em BCD
dado04: 00 ; resultado em BCD
