// -------------------------
// Guia 1301
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module contador_decrescente_5bits (output [4:0] count, input clk, input clear);
  reg [4:0] count;

  always @(posedge clk or posedge clear) begin
    if (clear)
      count <= 5'b10000; // Inicializa com 16 (decimal)
    else
      count <= count - 1;
  end
endmodule
