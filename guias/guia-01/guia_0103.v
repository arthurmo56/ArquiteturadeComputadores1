/*
Nome: Arthur Martinho Medeiros Oliveira
Matricula:813168
*/
module DecimalToOtherBase(
    input [31:0] decimal,
    input [3:0] base,
    output reg [31:0] result
);

always @(decimal, base) begin
    case(base)
        4: result = {decimal[4:0]}; // Base 4
        8: result = {decimal[5:3], decimal[2:0]}; // Base 8
        16: result = {decimal[7:4], decimal[3:0]}; // Base 16
        default: result = decimal; // Base 10 (decimal) - fallback case
    endcase
end

endmodule

module Testbench;

reg [31:0] decimal;
reg [3:0] base;
wire [31:0] result;

DecimalToOtherBase converter(
    .decimal(decimal),
    .base(base),
    .result(result)
);

initial begin
    // Defina o número decimal a ser convertido e a base de destino
    decimal = 61;
    base = 4;
    $display("Decimal: %d, Base: %d, Resultado: %b", decimal, base, result);

    decimal = 54;
    base = 8;
    $display("Decimal: %d, Base: %d, Resultado: %b", decimal, base, result);

    decimal = 77;
    base = 16;
    $display("Decimal: %d, Base: %d, Resultado: %h", decimal, base, result);

    decimal = 151;
    base = 16;
    $display("Decimal: %d, Base: %d, Resultado: %h", decimal, base, result);

    decimal = 738;
    base = 16;
    $display("Decimal: %d, Base: %d, Resultado: %h", decimal, base, result);

    $finish;
end

endmodule
