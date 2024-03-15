/*
Nome: Arthur Martinho Medeiros Oliveira
Matricula:813168
*/
module BinaryToOtherBase(
    input [31:0] binary,
    input [3:0] base,
    output reg [31:0] result
);

integer i, j;
reg [3:0] group;

always @(binary, base) begin
    case(base)
        4: begin // Base 4
            j = 0;
            for (i = 31; i >= 0; i = i - 2) begin
                group = binary[i:i-1];
                if (group == 2'b00)
                    result[j] = 1'b0;
                else if (group == 2'b01)
                    result[j] = 1'b1;
                else if (group == 2'b10)
                    result[j] = 1'b2;
                else if (group == 2'b11)
                    result[j] = 1'b3;
                j = j + 1;
            end
        end
        8: begin // Base 8
            j = 0;
            for (i = 31; i >= 0; i = i - 3) begin
                group = binary[i:i-2];
                if (group == 3'b000)
                    result[j] = 3'b0;
                else if (group == 3'b001)
                    result[j] = 3'b1;
                else if (group == 3'b010)
                    result[j] = 3'b2;
                else if (group == 3'b011)
                    result[j] = 3'b3;
                else if (group == 3'b100)
                    result[j] = 3'b4;
                else if (group == 3'b101)
                    result[j] = 3'b5;
                else if (group == 3'b110)
                    result[j] = 3'b6;
                else if (group == 3'b111)
                    result[j] = 3'b7;
                j = j + 1;
            end
        end
        16: begin // Base 16
            j = 0;
            for (i = 31; i >= 0; i = i - 4) begin
                group = binary[i:i-3];
                case(group)
                    4'b0000: result[j] = 4'b0;
                    4'b0001: result[j] = 4'b1;
                    4'b0010: result[j] = 4'b2;
                    4'b0011: result[j] = 4'b3;
                    4'b0100: result[j] = 4'b4;
                    4'b0101: result[j] = 4'b5;
                    4'b0110: result[j] = 4'b6;
                    4'b0111: result[j] = 4'b7;
                    4'b1000: result[j] = 4'b8;
                    4'b1001: result[j] = 4'b9;
                    4'b1010: result[j] = 4'ba;
                    4'b1011: result[j] = 4'bb;
                    4'b1100: result[j] = 4'bc;
                    4'b1101: result[j] = 4'bd;
                    4'b1110: result[j] = 4'be;
                    4'b1111: result[j] = 4'bf;
                endcase
                j = j + 1;
            end
        end
        default: result = binary; // Base 2 (binary) - fallback case
    endcase
end

endmodule

module Testbench;

reg [31:0] binary;
reg [3:0] base;
wire [31:0] result;

BinaryToOtherBase converter(
    .binary(binary),
    .base(base),
    .result(result)
);

initial begin
    // Defina o número binário a ser convertido e a base de destino
    binary = 10101;
    base = 4;
    $display("Binary: %b, Base: %d, Resultado: %b", binary, base, result);

    binary = 11010;
    base = 8;
    $display("Binary: %b, Base: %d, Resultado: %b", binary, base, result);

    binary = 100111;
    base = 16;
    $display("Binary: %b, Base: %d, Resultado: %h", binary, base, result);

    binary = 101001;
    base = 8;
    $display("Binary: %b, Base: %d, Resultado: %b", binary, base, result);

    binary = 101101;
    base = 4;
    $display("Binary: %b, Base: %d, Resultado: %b", binary, base, result);

    $finish;
end

endmodule
