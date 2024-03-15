/*

Guia_0403.v
Aluno- Arthur Martinho Medeiros Oliveira	
Matricula- 813168

*/
module SoP_e(output f, input x, y, w, z);
assign f = (~x & y & ~w & z) | (x & ~y & ~w & ~z) | (x & y & ~w & ~z) | (~x & y & w & ~z) |
          (~x & ~y & ~w & ~z) | (~x & ~y & w & z);
endmodule
