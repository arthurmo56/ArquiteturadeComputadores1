// -------------------------
// Guia_0502.v - GATES
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module f7 (output s, input a, input b);
  // Definir dados locais
  wire not_b;
  
  // Descrever por portas
  wire a_or_not_b;
  nand NAND1 (a_or_not_b, a, not_b);
  nand NAND2 (s, a_or_not_b, a_or_not_b);
  
endmodule // f7

module test_f7;
  // Definir dados
  reg x;
  reg y;
  wire s;
  
  f7 moduloD (s, x, y);
  
  // Parte principal
  initial begin
      $display("Guia_0502 - Arthur Martinho Medeiros Oliveira - 813168");
    $display("Test module");
    $display(" x y s");
    
    
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
    $finish; 
  end
endmodule // test_f7
