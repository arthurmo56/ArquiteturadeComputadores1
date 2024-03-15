// -------------------------
// Guia 0705
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module Guia_0705 (
    output s, // Saída selecionável
    input a,  // Entrada a
    input b,  // Entrada b
    input [2:0] select // Chave de seleção (000 para NOT, 001 para AND, 010 para NAND, 011 para XOR, 100 para XNOR, 101 para OR, 110 para NOR)
);

wire not_output;
wire and_output;
wire nand_output;
wire xor_output;
wire xnor_output;
wire or_output;
wire nor_output;

// Implementação das operações
not NOT1 (not_output, a);
and AND1 (and_output, a, b);
nand NAND1 (nand_output, a, b);
xor XOR1 (xor_output, a, b);
xnor XNOR1 (xnor_output, a, b);
or OR1 (or_output, a, b);
nor NOR1 (nor_output, a, b);

// Selecionar a saída com base na chave de seleção
assign s = (select == 3'b000) ? not_output :
             (select == 3'b001) ? and_output :
             (select == 3'b010) ? nand_output :
             (select == 3'b011) ? xor_output :
             (select == 3'b100) ? xnor_output :
             (select == 3'b101) ? or_output : nor_output;

endmodule

module test_Guia_0705;

    reg a;
    reg b;
    reg [2:0] select;
    wire s;

    // Instanciar a unidade lógica (LU) para teste
    Guia_0705 myLU (
        .s(s),
        .a(a),
        .b(b),
        .select(select)
    );

    // Inicialização
    initial begin
        $display("Guia_0705 - Teste da Unidade Lógica");
        $display(" a b select s");

        // Teste 1: NOT selecionado (select = 000)
        a = 1'b0; b = 1'b1; select = 3'b000;
        #1 $monitor("%b %b %b %b", a, b, select, s);

        // Teste 2: AND selecionado (select = 001)
        a = 1'b1; b = 1'b1; select = 3'b001;
        #1 $monitor("%b %b %b %b", a, b, select, s);

        // Teste 3: NAND selecionado (select = 010)
        a = 1'b1; b = 1'b0; select = 3'b010;
        #1 $monitor("%b %b %b %b", a, b, select, s);

        // Teste 4: XOR selecionado (select = 011)
        a = 1'b0; b = 1'b1; select = 3'b011;
        #1 $monitor("%b %b %b %b", a, b, select, s);

        $finish;
    end

endmodule
