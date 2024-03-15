/*
Nome: Arthur Martinho Medeiros Oliveira
Matricula:813168
*/
module DecimalToBinary(
    input [31:0] decimal,
    output [31:0] binary
);

assign binary = 0;

always @(decimal) begin
    integer i;
    for (i = 31; i >= 0; i = i - 1) begin
        binary[i] = decimal % 2;
        decimal = decimal / 2;
    end
end

endmodule

module Testbench;

reg [31:0] decimal;
wire [31:0] binary;

DecimalToBinary converter(
    .decimal(decimal),
    .binary(binary)
);

initial begin
    // Defina o número decimal a ser convertido
    decimal = 365;

    // Aguarde um pouco para a simulação concluir
    #10;

    // Exibir o resultado da conversão
    $display("Decimal: %d", decimal);
    $display("Binary: %b", binary);
    $finish;
end

endmodule
