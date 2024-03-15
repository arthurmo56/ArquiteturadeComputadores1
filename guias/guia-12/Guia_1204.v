// -------------------------
// Guia 1204
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module RAM4x8 (
    input wire CLK_,
    input wire R/W_,
    input wire [1:0] ADDR_,
    input wire [7:0] _input,
    output wire [7:0] _output,
    input wire CLR
);

reg [7:0] ram[0:3];

always @(posedge CLK_) begin
    if (CLR)
        begin
            ram[0] <= 8'b0;
            ram[1] <= 8'b0;
            ram[2] <= 8'b0;
            ram[3] <= 8'b0;
        end
    else if (R/W_ == 1'b1)
        begin
            case(ADDR_)
                2'b00: ram[0] <= _input;
                2'b01: ram[1] <= _input;
                2'b10: ram[2] <= _input;
                2'b11: ram[3] <= _input;
            endcase
        end
end

assign _output = {ram[3], ram[2], ram[1], ram[0]};

endmodule
