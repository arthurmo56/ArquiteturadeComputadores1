// -------------------------
// Guia 1103
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module Guia_1103 (
  output reg y,
  input x,
  input clk,
  input reset
);
  
  reg [4:0] state;
  parameter IDLE = 5'b00000;
  parameter S1 = 5'b00001;
  parameter S10 = 5'b00010;
  parameter S100 = 5'b00100;
  parameter S1001 = 5'b01001;
  parameter FOUND = 5'b10010;

  always @(posedge clk or negedge reset) begin
    if (reset) begin
      state <= IDLE;
      y <= 0;
    end else begin
      case (state)
        IDLE: if (x) state <= S1;
        S1: if (x) state <= S10; else state <= S1;
        S10: if (x) state <= S100; else state <= S1;
        S100: if (x) state <= S1001; else state <= S1;
        S1001: if (x) state <= FOUND; else state <= S1;
        FOUND: state <= IDLE;
        default: state <= IDLE;
      endcase
    end
  end

  always @(posedge clk) begin
    if (state == FOUND) y <= 1;
    else y <= 0;
  end

endmodule
