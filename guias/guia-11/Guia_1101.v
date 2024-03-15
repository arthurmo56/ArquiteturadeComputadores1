// -------------------------
// Guia 1101
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module Guia_1101 (
  output reg y,
  input x,
  input clk,
  input reset
);
  
  reg [3:0] state;
  parameter IDLE = 4'b0000;
  parameter S1 = 4'b0001;
  parameter S10 = 4'b0010;
  parameter S100 = 4'b0100;
  parameter FOUND = 4'b1000;

  always @(posedge clk or negedge reset) begin
    if (reset) begin
      state <= IDLE;
      y <= 0;
    end else begin
      case (state)
        IDLE: if (x) state <= S1;
        S1: if (x) state <= S10; else state <= IDLE;
        S10: if (x) state <= S100; else state <= IDLE;
        S100: if (x) state <= FOUND; else state <= IDLE;
        FOUND: state <= FOUND;
        default: state <= IDLE;
      endcase
    end
  end

  always @(posedge clk) begin
    if (state == FOUND) y <= 1;
    else y <= 0;
  end

endmodule
