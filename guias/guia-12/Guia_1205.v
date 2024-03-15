// -------------------------
// Guia 1205
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module RAM8x8 (
    input wire CLK_,
    input wire R/W_,
    input wire [2:0] ADDR_,
    input wire [7:0] _input,
    output wire [7:0] _output,
    input wire CLR
);

reg [7:0] ram0[0:3], ram1[0:3];

always @(posedge CLK_) begin
    if (CLR)
        begin
            for (int i = 0; i < 4; i = i + 1)
                begin
                    ram0[i] <= 8'b0;
                    ram1[i] <= 8'b0;
                end
        end
    else if (R/W_ == 1'b1)
        begin
            case (ADDR_)
                3'b000: ram0[0] <= _input;
                3'b001: ram0[1] <= _input;
                3'b010: ram0[2] <= _input;
                3'b011: ram0[3] <= _input;
                3'b100: ram1[0] <= _input;
                3'b101: ram1[1] <= _input;
                3'b110: ram1[2] <= _input;
                3'b111: ram1[3] <= _input;
            endcase
        end
end

assign _output = (ADDR_ <= 3'b011) ? ram0[ADDR_] : ram1[ADDR_ - 4'b100];

endmodule
