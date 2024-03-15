// -------------------------
// Guia_0601.v 
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module simplificadas (
  input x, y, w, z,
  output a,
  output b,
  output c,
  output d,
  output e
);

  wire term1_a, term2_a, term3_a;
  wire term1_b, term2_b, term3_b;
  wire term1_c, term2_c, term3_c;
  wire term1_d, term2_d, term3_d;
  wire term1_e, term2_e, term3_e;
  
  // Função a) f(x, y, w, z) = xz' + yz + wz'
  assign term1_a = x & z' & ~y;
  assign term2_a = y & z;
  assign term3_a = w & z' & ~y;
  assign a = term1_a | term2_a | term3_a;
  
  // Função b) f(x, y, w, z) = 1
  assign b = 1;
  
  // Função c) f(x, y, w, z) = xz + wz + yz
  assign term1_c = x & z;
  assign term2_c = w & z;
  assign term3_c = y & z;
  assign c = term1_c | term2_c | term3_c;
  
  // Função d) f(x, y, w, z) = xz + yz + wz'
  assign term1_d = x & z;
  assign term2_d = y & z;
  assign term3_d = w & z';
  assign d = term1_d | term2_d | term3_d;
  
  // Função e) f(x, y, w, z) = xz' + yz' + wz'
  assign term1_e = x & ~z & ~y;
  assign term2_e = y & ~z & ~x;
  assign term3_e = w & ~z & ~x;
  assign e = term1_e | term2_e | term3_e;

endmodule
