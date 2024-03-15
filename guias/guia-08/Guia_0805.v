// -------------------------
// Guia 0805
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
// -------------------------
// Guia_0805 - Logical Unit (LU) - Two's Complement
// -------------------------
module Guia_0805 (
  output wire [5:0] complementOut, // Saída do complemento de 2 de 6 bits
  input wire [5:0] inputVal // Entrada de 6 bits
);

  wire [5:0] onesComplement; // Saída do complemento de 1 de 6 bits
  wire carryIn;

  // Subcircuito para calcular o complemento de 1
  Guia_0806 OnesComplementCalculator (onesComplement, inputVal);

  // Adiciona 1 ao complemento de 1 para obter o complemento de 2
  fullAdder FA0 (complementOut[0], carryIn, onesComplement[0], 1'b1, 1'b0);
  fullAdder FA1 (complementOut[1], carryIn, onesComplement[1], 1'b0, carryIn);
  fullAdder FA2 (complementOut[2], carryIn, onesComplement[2], 1'b0, carryIn);
  fullAdder FA3 (complementOut[3], carryIn, onesComplement[3], 1'b0, carryIn);
  fullAdder FA4 (complementOut[4], carryIn, onesComplement[4], 1'b0, carryIn);
  fullAdder FA5 (complementOut[5], carryIn, onesComplement[5], 1'b0, carryIn);

  // Teste do complemento de 2
  initial begin
    $display("Guia_0805 - Arthur Martinho M. Oliveira-813168");
    $display("Teste do Complemento de 2");
    // Inserir valor de teste para inputVal
    inputVal = 6'b001101;
    $display("Entrada: %b", inputVal);
    $display("Complemento de 2: %b", complementOut);
  end

endmodule

module complementodeum (
  output wire [5:0] onesComplementOut, // Saída do complemento de 1 de 6 bits
  input wire [5:0] inputVal // Entrada de 6 bits
);

  // Calcula o complemento de 1 invertendo todos os bits
  assign onesComplementOut = ~inputVal;

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
