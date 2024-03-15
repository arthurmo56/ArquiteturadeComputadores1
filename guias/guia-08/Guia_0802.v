// -------------------------
// Guia 0802
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module Guia_0802 (
  output wire s05, s04, s03, s02, s01, s00, // Saída de 6 bits
  output wire borrowOut, // Vem-um de saída
  input wire [5:0] a, // Entrada A de 6 bits
  input wire [5:0] b // Entrada B de 6 bits
);

  wire [5:0] borrow; // Vem-um

  // Subtrator completo de 6 bits usando fullSubtractor
  fullSubtractor FS0 (s00, borrow[0], a[0], b[0], 1'b0);
  fullSubtractor FS1 (s01, borrow[1], a[1], b[1], borrow[0]);
  fullSubtractor FS2 (s02, borrow[2], a[2], b[2], borrow[1]);
  fullSubtractor FS3 (s03, borrow[3], a[3], b[3], borrow[2]);
  fullSubtractor FS4 (s04, borrow[4], a[4], b[4], borrow[3]);
  fullSubtractor FS5 (s05, borrowOut, a[5], b[5], borrow[4]);

  // Teste de subtrator completo
  initial begin
    $display("Guia_0802 - Arthur Martinho M. Oliveira-813168");
    $display("Teste do Subtrator Completo");
    // Inserir valores de teste para a e b
    a = 6'b110110;
    b = 6'b101001;
    $display("Entrada A: %b", a);
    $display("Entrada B: %b", b);
    $display("Resultado: %b", {s05, s04, s03, s02, s01, s00});
    $display("Vem-um de Saída: %b", borrowOut);
  end

endmodule

// -------------------------
// Full Subtractor
// -------------------------
module fullSubtractor (
  output wire difference, // Diferença
  output wire borrowOut, // Vem-um de saída
  input wire a, // Entrada A
  input wire b, // Entrada B
  input wire borrowIn // Vem-um de entrada
);

  wire w1, w2, w3;

  // Implementação do full subtractor usando portas nativas
  xor XOR1 (w1, a, b);
  xor XOR2 (difference, w1, borrowIn);
  and AND1 (w2, ~a, b);
  and AND2 (w3, w1, ~borrowIn);
  or OR1 (borrowOut, w2, w3);

endmodule
