// -------------------------
// Guia 1304
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module contador_decadico_decrescente_4bits (output [3:0] count, input clk, input clear);
  reg [3:0] count;

  always @(posedge clk or posedge clear) begin
    if (clear)
      count <= 4'b1001; // Inicializa com 9 (decimal)
    else if (count == 0)
      count <= 4'b1001; // Reinicia em 9 após atingir 0
    else
      count <= count - 1;
  end
endmodule
