/*

Guia_0401.v
Aluno- Arthur Martinho Medeiros Oliveira	
Matricula- 813168

*/
module Proposition_e(output f, input x, y, z);
assign f = (x' | y) & (y' | z');
endmodule
