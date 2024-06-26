// Guia_1604.txt
// 813168 - Arthur Martinho Medeiros Oliveira
// Encontrar o maior valor em um arranjo usando BubbleSort

// main ( ) {
MAIN: LXI H,Arr // HL = Endereço do arranjo
 MVI C,10 // Número de elementos no arranjo

OUTER_LOOP: MOV B,C // B = Contador externo
INNER_LOOP: MOV A,M // A = Elemento atual
 INX H // Próximo elemento
 CMP M // Comparar com o próximo elemento
 JZ NO_SWAP // Se iguais, não trocar
 CALL SWAP // Trocar elementos
NO_SWAP: DCR B // Decrementar o contador interno
 JZ EXIT_INNER // Se zero, sair do loop interno
 JMP INNER_LOOP // Repetir o loop interno

EXIT_INNER: DCR C // Decrementar o contador externo
 JZ END_SORTING // Se zero, sair do loop externo
 JMP OUTER_LOOP // Repetir o loop externo

END_SORTING: STA 0052 // MEM[0052] = Maior valor
 HLT // }

// Função para trocar dois elementos
SWAP: MOV D,A // D = A
 MOV A,M // A = Próximo elemento
 MOV M,D // Trocar elementos
 RET

Arr: DB 05, 02, 10, 01, 07, 13, 04, 09, 06, 03 // Arranjo de exemplo
