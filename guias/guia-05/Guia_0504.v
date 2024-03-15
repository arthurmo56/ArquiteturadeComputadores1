// -------------------------
// Guia_0504.v - GATES
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module f9 (output s, input a, input b);
  // Definir dados locais
  wire not_a_and_b, not_not_a_and_b;
  
  // Descrever por portas
  nand NAND1 (not_a_and_b, ~a, b);
  nand NAND2 (not_not_a_and_b, not_a_and_b, not_a_and_b);
  nand NAND3 (s, not_not_a_and_b, not_not_a_and_b);
  
endmodule // f9

module test_f9;
  // Definir dados
  reg x;
  reg y;
  wire s;
  
  f9 moduloF (s, x, y);
  
  // Parte principal
  initial begin : main
      $display("Guia_0504 - Arthur Martinho Medeiros Oliveira - 813168");
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
endmodule // test_f9