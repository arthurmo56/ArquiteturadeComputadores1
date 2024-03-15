// -------------------------
// Guia_0601.v 
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module simplificadas (
  input x, y, z,
  output a,
  output b,
  output c,
  output d,
  output e
);

  assign a = (~x & ~z) | (y & ~z) | (x & ~y);
  assign b = (~x & z) | (y & ~z) | (~y & z);
  assign c = (~y & ~z) | (x & y & z) | (~x & y & z);
  assign d = (y & ~z) | (x & y & z) | (~x & z);
  assign e = (~x & y) | (y & ~z) | (x & y & z) | (x & z);

endmodule

module testbench;
  reg x, y, z;
  wire a, b, c, d, e;

  simplificadas uut (
    .x(x),
    .y(y),
    .z(z),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e)
  );

  initial begin
   
    x = 0; y = 0; z = 0;
    #10 $display("a=%b, b=%b, c=%b, d=%b, e=%b", a, b, c, d, e);

   
    x = 1; y = 0; z = 1;
    #10 $display("a=%b, b=%b, c=%b, d=%b, e=%b", a, b, c, d, e);

   
    $finish;
  end

endmodule
