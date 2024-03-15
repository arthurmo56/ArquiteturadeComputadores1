// Guia_1601.txt
// 813168 - Arthur Martinho Medeiros Oliveira
// dado03 = dado01 * dado02

// main ( ) {
MAIN: LXI H,0050 // HL = 0050h // dado1
 MOV B,M // B = MEM [HL]
 INX H // HL = HL+1 // dado2
 MOV C,M // C = MEM [HL]
 MVI A,00 // A = 0 // Inicializar o resultado

MULT_LOOP: CMP B // Comparar A com B
 JZ END_MULTIPLICATION // Se B for 0, terminar
 CALL ADD_A_WITH_C // A = A + C
 DCR B // B = B - 1
 JMP MULT_LOOP // Repetir o loop

END_MULTIPLICATION: STA 0052 // MEM[0052] = A
 HLT // }

// Função para adicionar valor de C a A
ADD_A_WITH_C: ADD C
 STA A // A = A + C
 RET
