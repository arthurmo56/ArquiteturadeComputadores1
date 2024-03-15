// -------------------------
// Guia_0501.v - GATES
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module f6 (output s, input a, input b);
  // Definir dados locais
  wire not_a, not_b;
  
  // Descrever por portas
  nor NOR1 (not_a, a, a);
  nor NOR2 (not_b, b, b);
  nor NOR3 (s, not_a, not_b);
  
endmodule // f6

module test_f6;
  // ------------------------- Definir dados
  reg x;
  reg y;
  wire s;
  
  f6 moduloC (s, x, y);
  
  // ------------------------- Parte principal
  initial begin : main
      $display("Guia_0501 - Arthur Martinho Medeiros Oliveira - 813168");
    $display("Test module");
    $display(" x y s");
    
    // Projetar testes do modulo
    $monitor("%4b %4b %4b", x, y, s);
    
    x = 1'b0; y = 1'b0;
    #1 x = 1'b0; y = 1'b1;
    #1 x = 1'b1; y = 1'b0;
    #1 x = 1'b1; y = 1'b1;
  end
endmodule // test_f6
