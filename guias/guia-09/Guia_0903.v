// -------------------------
// Guia 0903
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module pulse (output signal, input clock);
  reg signal;

  always @(posedge clock) begin
    signal = 1'b1;
    #4 signal = 1'b0; 
  end
endmodule // pulse

module Guia_0903;
  wire clock;
  reg [2:0] count;
  wire p;

  pulse pls (p, clock);

  initial begin
    count = 3'b000;
    $dumpfile("Guia_0903.vcd");
    $dumpvars(1, clock, p);
    #480 $finish;
  end

  initial begin
    $readmemh("clock.mem", count);
  end

  always @(posedge clock) begin
    count <= count + 1;
  end

endmodule // Guia_0903
