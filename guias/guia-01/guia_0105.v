/*
Nome: Arthur Martinho Medeiros Oliveira
Matricula:813168
*/
module ASCIIConverter(
    input [7:0] data_in,
    output reg [7:0] ascii_out
);

always @(data_in) begin
    case(data_in)
        8'd80: ascii_out = "P"; // P
        8'd85: ascii_out = "U"; // U
        8'd67: ascii_out = "C"; // C
        8'd45: ascii_out = "-"; // -
        8'd4D: ascii_out = "M"; // M
        8'd69: ascii_out = "i"; // i
        8'd6E: ascii_out = "n"; // n
        8'd61: ascii_out = "a"; // a
        8'd73: ascii_out = "s"; // s
        8'd32: ascii_out = "2"; // 2
        8'd30: ascii_out = "0"; // 0
        8'd33: ascii_out = "3"; // 3
        8'd42: ascii_out = "B"; // B
        8'd65: ascii_out = "e"; // e
        8'd6C: ascii_out = "l"; // l
        8'd6F: ascii_out = "o"; // o
        8'd20: ascii_out = " "; // (espaço)
        8'd48: ascii_out = "H"; // H
        8'd72: ascii_out = "r"; // r
        8'd7A: ascii_out = "z"; // z
        8'd74: ascii_out = "t"; // t
        8'd6D: ascii_out = "m"; // m
        8'd4E: ascii_out = "N"; // N
        8'd74: ascii_out = "t"; // t
        8'd65: ascii_out = "e"; // e
        8'd4D: ascii_out = "M"; // M
        8'd2E: ascii_out = "."; // .
        8'd47: ascii_out = "G"; // G
        default: ascii_out = 8'h00; // Caractere nulo (fallback case)
    endcase
end

endmodule

module Testbench;

reg [7:0] data_in;
wire [7:0] ascii_out;

ASCIIConverter converter(
    .data_in(data_in),
    .ascii_out(ascii_out)
);

initial begin
    // Defina os caracteres a serem convertidos
    data_in = "PUC-Minas";
    $display("Entrada: %s, Resultado: %c", data_in, ascii_out);

    data_in = "2023-02";
    $display("Entrada: %s, Resultado: %c", data_in, ascii_out);

    data_in = "Belo Horizonte";
    $display("Entrada: %s, Resultado: %c", data_in, ascii_out);

    data_in = "toite";
    $display("Entrada: %s, Resultado: %c", data_in,

