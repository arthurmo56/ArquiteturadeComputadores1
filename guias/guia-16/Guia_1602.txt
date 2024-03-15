// Guia_1602.txt
// 813168 - Arthur Martinho Medeiros Oliveira
// dado03 = dado01 / dado02

// main ( ) {
MAIN: LXI H,0050 // HL = 0050h // dado1
 MOV B,M // B = MEM [HL]
 INX H // HL = HL+1 // dado2
 MOV C,M // C = MEM [HL]
 MVI A,00 // A = 0 // Inicializar o quociente

DIV_LOOP: CMP B // Comparar A com B
 JC END_DIVISION // Se A < B, terminar
 CALL SUBTRACT_B_FROM_A // A = A - B
 INX A // Incrementar o quociente
 JMP DIV_LOOP // Repetir o loop

END_DIVISION: STA 0052 // MEM[0052] = Quociente
 HLT // }

// Função para subtrair valor de B de A
SUBTRACT_B_FROM_A: SUB B
 STA A // A = A - B
 RET
