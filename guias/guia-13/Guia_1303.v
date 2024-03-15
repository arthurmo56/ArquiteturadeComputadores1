// -------------------------
// Guia 1303
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module contador_decadico_crescente_4bits (output [3:0] count, input clk, input clear);
  reg [3:0] count;

  always @(posedge clk or posedge clear) begin
    if (clear)
      count <= 4'b0000; // Inicializa com 0 (decimal)
    else if (count == 9)
      count <= 4'b0000; // Reinicia em 0 após atingir 9
    else
      count <= count + 1;
  end
endmodule
