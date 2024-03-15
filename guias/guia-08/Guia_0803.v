// -------------------------
// Guia 0803
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module Guia_0803 (
  output wire [4:0] s, // Saída de 5 bits (resultado do comparador)
  input wire [5:0] a, // Entrada A de 6 bits
  input wire [5:0] b // Entrada B de 6 bits
);

  // Comparador de igualdade usando portas nativas (XNOR)
  assign s[0] = ~(a[0] ^ b[0]);
  assign s[1] = ~(a[1] ^ b[1]);
  assign s[2] = ~(a[2] ^ b[2]);
  assign s[3] = ~(a[3] ^ b[3]);
  assign s[4] = ~(a[4] ^ b[4]);

  // Teste do comparador de igualdade
  initial begin
    $display("Guia_0803 - Arthur Martinho M. Oliveira-813168");
    $display("Teste do Comparador de Igualdade");
    // Inserir valores de teste para a e b
    a = 6'b110110;
    b = 6'b110110;
    $display("Entrada A: %b", a);
    $display("Entrada B: %b", b);
    $display("Resultado: %b", s);
  end

endmodule
