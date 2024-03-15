/*

Guia_0405.v
Aluno- Arthur Martinho Medeiros Oliveira	
Matricula- 813168

*/
module SOP_PoS_e(output f_sop, f_pos, input x, y, w, z);

assign f_sop = (~x & ~y & ~w & ~z) | (~x & ~y & w & ~z) | (~x & ~y & ~w & z) | (~x & y & ~w & z) |
                (x & ~y & ~w & ~z) | (x & ~y & w & ~z) | (x & y & ~w & ~z) | (x & y & w & z);
assign f_pos = (~x | y | w | z) & (x | ~y | w | ~z) & (x | y | ~w | ~z) & (x | ~y | ~w | z);

endmodule
