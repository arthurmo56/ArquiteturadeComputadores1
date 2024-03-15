// -------------------------
// Guia_0601.v 
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module simplificadas (
  input X, Y, W, Z,
  output A,
  output B,
  output C,
  output D,
  output E
);

  // Função a) F(X, Y, W, Z) = X'Y'W'Z'W'Z + W'Z + WXYZ
  assign A = (~X & ~Y & ~W & ~Z & ~W & ~Z) | (W & Z) | (W & X & Y & Z);
  
  // Função b) F(X, Y, W, Z) = X'Y'W'Z' + W'Z + WXYZ
  assign B = (~X & ~Y & ~W & ~Z) | (W & Z) | (W & X & Y & Z);
  
  // Função c) F(X, Y, W, Z) = X'Y'W'Z'W'Z
  assign C = (~X & ~Y & ~W & ~Z & ~W & ~Z);
  
  // Função d) F(X, Y, W, Z) = X'Y'W'Z' + W'Z + WXYZ
  assign D = (~X & ~Y & ~W & ~Z) | (W & Z) | (W & X & Y & Z);
  
  // Função e) F(X, Y, W, Z) = X'Y'W'Z'W'Z
  assign E = (~X & ~Y & ~W & ~Z & ~W & ~Z);

endmodule
