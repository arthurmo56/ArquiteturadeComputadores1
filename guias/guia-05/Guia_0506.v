// -------------------------
// Guia_0506.v - GATES
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module f11 (output s, input a, input b);
  // Definir dados locais
  wire nand_1, nand_2, nand_3, nand_4;
  
  // Descrever por portas
  nand NAND1 (nand_1, a, a);
  nand NAND2 (nand_2, b, b);
  nand NAND3 (nand_3, a, b);
  nand NAND4 (s, nand_1, nand_2, nand_3);
  
endmodule // f11

module test_f11;
  // Definir dados
  reg x;
  reg y;
  wire s;
  
  f11 moduloH (s, x, y);
  
  // Parte principal
  initial begin : main
      $display("Guia_0506 - Arthur Martinho Medeiros Oliveira - 813168");
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
endmodule // test_f11
