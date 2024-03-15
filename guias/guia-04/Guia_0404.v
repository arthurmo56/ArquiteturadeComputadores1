/*

Guia_0404.v
Aluno- Arthur Martinho Medeiros Oliveira	
Matricula- 813168

*/
module PoS_e(output F, input X, Y, W, Z);
assign F = (~X | ~Y | ~W | ~Z) & (~X | ~Y | ~W | Z) & (~X | ~Y | W | ~Z) & (~X | ~Y | W | Z) & (~X | Y | ~W | Z) & (~X | Y | W | ~Z) & (X | ~Y | ~W | Z) & (X | ~Y | W | Z);
endmodule
