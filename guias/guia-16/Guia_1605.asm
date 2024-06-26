// Guia_1605.txt
// 813168 - Arthur Martinho Medeiros Oliveira
// dado02 = HI(dado01) * 10 + LOW(dado01)

// main ( ) {
MAIN: LXI H,0050 // HL = 0050h // dado1 (BCD)
 MOV A,M // A = MEM [HL]
 CALL F_HI // A = HI(dado1)
 MVI B,0A // B = 10
 CALL MULT_BY_TEN // A = A * 10
 MOV B,A // B = HI(dado1) * 10

INX H // Próximo byte no BCD
 MOV A,M // A = MEM [HL]
 CALL F_LOW // A = LOW(dado1)
 ADD B // A = A + HI(dado1) * 10
 STA 0052 // MEM[0052] = A (Hexadecimal)
 HLT // }

// Função para multiplicar A por 10
MULT_BY_TEN: DAD B // A = A + B
 RET

// Função para extrair o alto nibble de um byte
F_HI: ANI F0 // A = A & F0h
 RAR // A = A >> 1
 RAR // A = A >> 1
 RAR // A = A >> 1
 RAR // A = A >> 1
 RET

// Função para extrair o baixo nibble de um byte
F_LOW: ANI 0F // A = A & 0Fh
 RET

F0: DB F0h // Constante F0h
