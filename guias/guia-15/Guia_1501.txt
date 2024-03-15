// Guia_1501.txt
// 813168 - Arthur Martinho Medeiros Oliveira
//
// Calcular dado04 = dado01 + dado02 - dado03
//
LXI H, dado01 ; HL <- addr(dado01)   // endereco do dado01
MOV A, M ; A <- MEM [HL]  	     // A = MEM [dado01]
INX H ; HL <- HL+1 	  	     // endereco do dado02
ADD M ; A <- A + MEM [HL] 	     // A = A + MEM [dado02]
MOV B, A ; B <- A 	             // B = dado01 + dado02

LXI H, dado03 ; HL <- addr(dado03)   // endereco do dado03
MOV A, M ; A <- MEM [HL] 	     // A = MEM [dado03]
SUB B ; A <- A - B 		     // A = dado01 + dado02 - dado03

STA dado04 ; MEM [dado04] <- A ; MEM [dado04] = dado01 + dado02 - dado03
HLT ; halt ; parar

// Area de dados
dado01: 02h ; primeiro dado em hexadecimal
dado02: 03h ; segundo dado em hexadecimal
dado03: 01h ; terceiro dado em hexadecimal
dado04: 00h ; resultado em hexadecimal
