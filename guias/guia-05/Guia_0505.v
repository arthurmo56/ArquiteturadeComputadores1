// -------------------------
// Guia_0504.v - GATES
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module f10 (output s, input a, input b);
  // Definir dados locais
  wire not_a, not_b, and_1, and_2, or_1, or_2;
  
  // Descrever por portas
  nor NOR1 (not_a, a, a);
  nor NOR2 (not_b, b, b);
  nor NOR3 (and_1, not_a, not_b);
  nor NOR4 (and_2, a, b);
  nor NOR5 (or_1, and_1, and_1);
  nor NOR6 (or_2, and_2, and_2);
  nor NOR7 (s, or_1, or_2);
  
endmodule // f10

module test_f10;
  // Definir dados
  reg x;
  reg y;
  wire s;
  
  f10 moduloG (s, x, y);
  
  // Parte principal
  initial begin : main
      $display("Guia_0505 - Arthur Martinho Medeiros Oliveira - 813168");
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
    #5
    x = 1; y = 1;
    #5;
      
    $finish; // Encerra a simulação
  end
endmodule // test_f10
