// -------------------------
// Guia 1203
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module RAM2x8 (
    input wire CLK_,
    input wire R/W_,
    input wire [1:0] ADDR_,
    input wire [7:0] _input,
    output wire [7:0] _output,
    input wire CLR
);

reg [3:0] ram_upper, ram_lower;

always @(posedge CLK_) begin
    if (CLR)
        begin
            ram_upper <= 4'b0;
            ram_lower <= 4'b0;
        end
    else if (R/W_ == 1'b1)
        begin
            if (ADDR_ == 2'b00)
                ram_upper <= _input[7:4];
            else if (ADDR_ == 2'b01)
                ram_lower <= _input[3:0];
        end
end

assign _output = {ram_upper, ram_lower};

endmodule
