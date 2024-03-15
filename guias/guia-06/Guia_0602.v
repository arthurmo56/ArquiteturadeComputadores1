// -------------------------
// Guia_0601.v 
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module simplificadas (
  input X, Y, Z,
  output A,
  output B,
  output C,
  output D,
  output E
);

  wire term1_a, term2_a, term3_a;
  wire term1_b, term2_b, term3_b;
  wire term1_c, term2_c, term3_c, term4_c;
  wire term1_d, term2_d, term3_d, term4_d;
  wire term1_e, term2_e, term3_e, term4_e;
  
  // Função a) F(X, Y, Z) = ΠM(4, 5, 7)
  assign term1_a = X | Y' | Z;
  assign term2_a = X | Y | Z;
  assign term3_a = X' | Y' | Z';
  assign A = term1_a & term2_a & term3_a;
  
  // Função b) F(X, Y, Z) = ΠM(2, 5, 6)
  assign term1_b = X | Y | Z';
  assign term2_b = X | Y' | Z';
  assign term3_b = X' | Y | Z;
  assign B = term1_b & term2_b & term3_b;
  
  // Função c) F(X, Y, Z) = ΠM(1, 2, 3, 5)
  assign term1_c = X' | Y' | Z';
  assign term2_c = X | Y' | Z';
  assign term3_c = X' | Y | Z';
  assign term4_c = X | Y | Z;
  assign C = term1_c & term2_c & term3_c & term4_c;
  
  // Função d) F(X, Y, Z) = ΠM(2, 3, 5, 7)
  assign term1_d = X | Y | Z';
  assign term2_d = X' | Y | Z';
  assign term3_d = X | Y | Z;
  assign term4_d = X' | Y' | Z';
  assign D = term1_d & term2_d & term3_d & term4_d;
  
  // Função e) F(X, Y, Z) = ΠM(2, 4, 6, 7)
  assign term1_e = X | Y | Z';
  assign term2_e = X' | Y | Z;
  assign term3_e = X' | Y' | Z;
  assign term4_e = X | Y' | Z';
  assign E = term1_e & term2_e & term3_e & term4_e;

endmodule
