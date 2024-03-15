// -------------------------
// Guia 1202
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module RAM1x8 (
    input wire CLK_,
    input wire R/W_,
    input wire ADDR_,
    input wire [3:0] _input,
    output wire [7:0] _output,
    input wire CLR
);

reg [3:0] ram_upper, ram_lower;

always @(posedge CLK_) begin
    if (CLR)
        ram_upper <= 4'b0;
    else if (R/W_ == 1'b1 && ADDR_ == 1'b0)
        ram_upper <= _input;
    else if (R/W_ == 1'b1 && ADDR_ == 1'b1)
        ram_lower <= _input;
end

assign _output = {ram_upper, ram_lower};

endmodule
