// -------------------------
// Guia 0901
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------

module pulse (output signal, input clock);
  reg signal;
  always @ (posedge clock)
    begin
      signal = 1'b1;
      #3 signal = 1'b0;
      #3 signal = 1'b1;
      #3 signal = 1'b0;
    end
endmodule // pulse

module trigger (output signal, input on, input clock);
  reg signal;
  always @ (posedge clock and on)
    begin
      #60 signal = 1'b1;
      #60 signal = 1'b0;
    end
endmodule // trigger

module Guia_0901;
  wire clock;
  reg on;
  reg [7:0] count;
  wire p1, t1;

  pulse pulse1 (p1, clock);
  trigger trigger1 (t1, on, clock);

  initial begin
    on = 1'b0;
    count = 8'h0;
    $dumpfile("Guia_0901.vcd");
    $dumpvars(1, clock, p1, on, t1);
    #60 on = 1'b1;
    #120 on = 1'b0;
    #180 on = 1'b1;
    #240 on = 1'b0;
    #300 on = 1'b1;
    #360 on = 1'b0;
    #376 $finish;
  end

  always begin
    #12 clock = ~clock;
  end

  
  always @(posedge clock) begin
    count <= count + 1;
  end

endmodule // Guia_0901
