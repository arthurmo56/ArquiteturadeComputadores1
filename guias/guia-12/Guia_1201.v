// -------------------------
// Guia 1201
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module RAM1x4 (
    input wire CLK_,
    input wire R/W_,
    input wire [1:0] ADDR_,
    input wire [3:0] _input,
    output wire [3:0] _output,
    input wire CLR
);

reg [3:0] ram[0:1];

always @(posedge CLK_) begin
    if (CLR)
        ram[ADDR_] <= 4'b0;
    else if (R/W_ == 1'b1)
        ram[ADDR_] <= _input;
end

assign _output = ram[ADDR_];

endmodule
