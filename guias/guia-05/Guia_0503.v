// -------------------------
// Guia_0503.v - GATES
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module f8 (output s, input a, input b);
  // Definir dados locais
  wire not_a, not_b;
  
  // Descrever por portas
  nor NOR1 (not_a, a, a);
  nor NOR2 (not_b, b, b);
  nor NOR3 (s, not_a, not_b);
  
endmodule // f8

module test_f8;
  // Definir dados
  reg x;
  reg y;
  wire s;
  
  f8 moduloE (s, x, y);
  
  // Parte principal
  initial begin : main
      $display("Guia_0503 - Arthur Martinho Medeiros Oliveira - 813168");
    $display("Test module");
    $display(" x y s");
    
    // Ciclo de teste
    x = 0; y = 0;
    #5; 
      
    // Projetar testes do modulo
    $monitor("%4b %4b %4b", x, y, s);
    
    x = 0; y = 1;
    #5; 
    x = 1; y = 0;
    #5; 
    x = 1; y = 1;
    #5;
      
    $finish; // Encerra a simulação
  end
endmodule // test_f8
