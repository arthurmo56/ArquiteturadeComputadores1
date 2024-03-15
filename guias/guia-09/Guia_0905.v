// -------------------------
// Guia 0905
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module pulse (output signal, input clock);
  reg signal;

  always @(posedge clock) begin
    signal = 1'b0; 
    if (signal == 1'b0) begin
      #1 signal = 1'b1; 
    end
  end
endmodule // pulse

module Guia_0905;
  wire clock;
  wire pulse_signal;

  clock clk (clock);

  pulse pls (pulse_signal, clock);

  initial begin
    $dumpfile("Guia_0905.vcd");
    $dumpvars(1, clock, pulse_signal);
    #120 $finish;
  end
endmodule // Guia_0905
