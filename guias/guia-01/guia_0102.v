/*
Nome: Arthur Martinho Medeiros Oliveira
Matricula:813168
*/
module BinaryToDecimal(
    input [5:0] binary,
    output [5:0] decimal
);

assign decimal = 0;

always @(binary) begin
    integer i;
    for (i = 0; i < 6; i = i + 1) begin
        decimal = decimal + (binary[i] * (1 << (5 - i)));
    end
end

endmodule

module Testbench;

reg [5:0] binary;
wire [5:0] decimal;

BinaryToDecimal converter(
    .binary(binary),
    .decimal(decimal)
);

initial begin
    // Defina o número binário a ser convertido
    binary = 110111;

    // Aguarde um pouco para a simulação concluir
    #10;

    // Exibir o resultado da conversão
    $display("Binary: %b", binary);
    $display("Decimal: %d", decimal);
    $finish;
end

endmodule
