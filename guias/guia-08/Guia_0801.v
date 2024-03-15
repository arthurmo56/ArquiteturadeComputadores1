// -------------------------
// Guia 0801
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module Guia_0801 (
  output wire s05, s04, s03, s02, s01, s00, // Saída de 6 bits
  input wire [5:0] a, // Entrada A de 6 bits
  input wire [5:0] b // Entrada B de 6 bits
);

  wire [4:0] carry; // Vai-um

  // Somador completo de 6 bits usando fullAdder
  fullAdder FA0 (carry[0], s00, a[0], b[0], 1'b0);
  fullAdder FA1 (carry[1], s01, a[1], b[1], carry[0]);
  fullAdder FA2 (carry[2], s02, a[2], b[2], carry[1]);
  fullAdder FA3 (carry[3], s03, a[3], b[3], carry[2]);
  fullAdder FA4 (carry[4], s04, a[4], b[4], carry[3]);
  fullAdder FA5 (s05, carry[4], a[5], b[5], carry[4]);

  // Teste de somador completo
  initial begin
      $display("Guia_0801 - Arthur Martinho M. Oliveira-813168");
    $display("Teste do Somador Completo");
    // Inserir valores de teste para a e b
    a = 6'b101010;
    b = 6'b110011;
    $display("Entrada A: %b", a);
    $display("Entrada B: %b", b);
    $display("Resultado: %b", {s05, s04, s03, s02, s01, s00});
  end

endmodule

// -------------------------
// Full Adder
// -------------------------
module fullAdder (
  output wire sum, // Soma
  output wire carryOut, // Vai-um de saída
  input wire a, // Entrada A
  input wire b, // Entrada B
  input wire carryIn // Vai-um de entrada
);

  wire w1, w2, w3;

  // Implementação do full adder usando portas nativas
  xor XOR1 (w1, a, b);
  xor XOR2 (sum, w1, carryIn);
  and AND1 (w2, a, b);
  and AND2 (w3, w1, carryIn);
  or OR1 (carryOut, w2, w3);

endmodule
