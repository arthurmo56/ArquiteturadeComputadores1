// Guia_1502.txt
// 813168 - Arthur Martinho Medeiros Oliveira
//
// Calcular dado04 = dado01 - dado02 + dado03
// Usar complemento de 2 para a subtracao
//

LXI H, dado01 ; HL <- addr(dado01) ; endereco do dado01
MOV A, M ; A <- MEM [HL] ; A = MEM [dado01]
INX H ; HL <- HL+1 ; endereco do dado02
MOV B, M ; B <- MEM [HL] ; B = MEM [dado02]
DCR H ; HL <- HL-1 ; restaurar HL para dado01

MOV C, A ; C <- A ; C = dado01 (parte alta)
MOV A, B ; A <- B ; A = dado02 (parte baixa)
MOV D, A ; D <- A ; D = dado02 (parte baixa)

LXI H, dado02 ; HL <- addr(dado02) ; endereco do dado02
MOV E, M ; E <- MEM [HL] ; E = MEM [dado02] (parte alta)
INX H ; HL <- HL+1 ; endereco do dado03
MOV A, M ; A <- MEM [HL] ; A = MEM [dado03]
MOV H, A ; H <- A ; H = dado03 (parte alta)

MOV L, D ; L <- D ; L = dado02 (parte baixa)
MOV B, C ; B <- C ; B = dado01 (parte alta)

SUI 00h ; A <- A - 00h (complemento de 2)
MOV C, A ; C <- A ; C = -dado02 (parte baixa)
SUI 00h ; A <- A - 00h (complemento de 2)
MOV D, A ; D <- A ; D = -dado02 (parte alta)

MOV A, L ; A <- L ; A = dado02 (parte baixa)
ADI 01h ; A <- A + 01h ; A = dado02 (parte baixa) + 1
MOV L, A ; L <- A ; L = dado02 (parte baixa) + 1

MOV A, B ; A <- B ; A = dado01 (parte alta)
ADC D ; A <- A + D + CY ; A = dado01 (parte alta) - dado02 (parte alta)

MOV D, A ; D <- A ; D = resultado da subtracao

MOV A, E ; A <- E ; A = dado02 (parte alta)
SBB C ; A <- A - C - CY ; A = dado02 (parte alta) - (-dado02 (parte baixa)) - CY

MOV E, A ; E <- A ; E = resultado da subtracao

MOV A, H ; A <- H ; A = dado03 (parte alta)
ADC 00h ; A <- A + 00h + CY ; A = dado03 (parte alta) + CY

MOV H, A ; H <- A ; H = resultado da adicao

MOV A, L ; A <- L ; A = dado02 (parte baixa) + 1
ADC 00h ; A <- A + 00h + CY ; A = dado02 (parte baixa) + 1 + CY

MOV L, A ; L <- A ; L = resultado da adicao

STA dado04 ; MEM [dado04] <- L ; MEM [dado04] = dado04
HLT ; halt ; parar

// Area de dados
dado01: 0010h ; primeiro dado em hexadecimal (16 bits)
dado02: 00F3h ; segundo dado em hexadecimal (16 bits)
dado03: 0005h ; terceiro dado em hexadecimal (16 bits)
dado04: 0000h ; resultado em hexadecimal (16 bits)
