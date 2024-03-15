// -------------------------
// Guia 1302
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module contador_crescente_5bits (output [4:0] count, input clk, input clear);
  reg [4:0] count;

  always @(posedge clk or posedge clear) begin
    if (clear)
      count <= 5'b00000; // Inicializa com 0 (decimal)
    else
      count <= count + 1;
  end
endmodule
