// -------------------------
// Guia 0904
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module pulse (output signal, input clock);
  reg signal;

  always @(posedge clock) begin
    signal = 1'b1;
    #3 signal = 1'b0; 
  end
endmodule // pulse

module Guia_0904;
  wire clock;
  reg [1:0] count;
  wire p;

  pulse pls (p, clock);

  initial begin
    count = 2'b00;
    $dumpfile("Guia_0904.vcd");
    $dumpvars(1, clock, p);
    #120 $finish;
  end

  initial begin
    $readmemh("clock.mem", count);
  end

  always @(posedge clock) begin
    count <= count + 1;
  end

endmodule // Guia_0904
