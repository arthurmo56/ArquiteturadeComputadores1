// -------------------------
// Guia 0703 
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module Guia_0703 (
    output s, // Saída selecionável
    input a,  // Entrada a
    input b,  // Entrada b
    input select_output, // Chave de seleção para saída (0 para saída AND/OR, 1 para saída NAND/NOR)
    input select_group // Chave de seleção para grupo (0 para grupo AND/OR, 1 para grupo NAND/NOR)
);

wire group_output;
wire and_output;
wire or_output;
wire nand_output;
wire nor_output;

// Implementação das operações AND e OR no grupo 0 (AND/OR)
and AND1 (and_output, a, b);
or OR1 (or_output, a, b);

// Implementação das operações NAND e NOR no grupo 1 (NAND/NOR)
nand NAND1 (nand_output, a, b);
nor NOR1 (nor_output, a, b);
    
assign group_output = (select_group == 1'b0) ? ((select_output == 1'b0) ? and_output : or_output) : ((select_output == 1'b0) ? nand_output : nor_output);

assign s = group_output;

endmodule

module test_Guia_0703;

    reg a;
    reg b;
    reg select_output;
    reg select_group;
    wire s;

    // Instanciar a unidade lógica (LU) para teste
    Guia_0703 myLU (
        .s(s),
        .a(a),
        .b(b),
        .select_output(select_output),
        .select_group(select_group)
    );

    // Inicialização
    initial begin
        $display("Guia_0703 - Teste da Unidade Lógica");
        $display(" a b select_output select_group s");

        // Teste 1: Grupo AND/OR, AND selecionado (select_output = 0, select_group = 0)
        a = 1'b0; b = 1'b1; select_output = 1'b0; select_group = 1'b0;
        #1 $monitor("%b %b %b %b %b", a, b, select_output, select_group, s);

        // Teste 2: Grupo NAND/NOR, NOR selecionado (select_output = 1, select_group = 1)
        a = 1'b1; b = 1'b1; select_output = 1'b1; select_group = 1'b1;
        #1 $monitor("%b %b %b %b %b", a, b, select_output, select_group, s)

        $finish;
    end

endmodule
