// -------------------------
// Guia 1102
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module Guia_1102 (
  output y,
  input x,
  input clk,
  input reset
);
  
  reg [3:0] state;
  parameter IDLE = 4'b0000;
  parameter S1 = 4'b0001;
  parameter S10 = 4'b0010;
  parameter S100 = 4'b0100;
  parameter S1001 = 4'b1001;

  reg prev_x;
  wire seq_detected;

  always @(posedge clk or negedge reset) begin
    if (reset) begin
      state <= IDLE;
      y <= 0;
      prev_x <= 0;
    end else begin
      prev_x <= x;
      case (state)
        IDLE: if (x) state <= S1;
        S1: if (x) state <= S10; else state <= IDLE;
        S10: if (x) state <= S100; else state <= IDLE;
        S100: if (x) state <= S1001; else state <= IDLE;
        S1001: state <= IDLE;
        default: state <= IDLE;
      endcase
    end
  end

  always @(posedge clk) begin
    if (state == S1001 && !prev_x) y <= 1;
    else y <= 0;
  end

  assign seq_detected = (state == S1001 && !prev_x);

endmodule
