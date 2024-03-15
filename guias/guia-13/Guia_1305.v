// -------------------------
// Guia 1305
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module contador_sincrono_modulo9 (output [3:0] count, input clk, input reset);
  reg [3:0] count;

  always @(posedge clk or posedge reset) begin
    if (reset)
      count <= 4'b0000; // Inicializa com 0
    else if (count == 4'b1001) // Quando atinge 9
      count <= 4'b0000; // Reinicia em 0
    else
      count <= count + 1;
  end
endmodule
