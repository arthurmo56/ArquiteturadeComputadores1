// -------------------------
// Guia 0702 
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module Guia_0702 (
    output s, // Saída selecionável
    input a,  // Entrada a
    input b,  // Entrada b
    input select // Chave de seleção
);

wire or_output;
wire nor_output;

// Implementação da porta OR
or OR1 (or_output, a, b);

// Implementação da porta NOR
nor NOR1 (nor_output, a, b);

assign s = (select == 1'b0) ? or_output : nor_output;

endmodule
module test_Guia_0702;

    reg a;
    reg b;
    reg select;
    wire s;

    // Instanciar a unidade lógica (LU) para teste
    Guia_0702 myLU (
        .s(s),
        .a(a),
        .b(b),
        .select(select)
    );

    // Inicialização
    initial begin
        $display("Guia_0702 - Teste da Unidade Lógica");
        $display(" a b select s");

        // Teste 1: OR selecionado (select = 0)
        a = 1'b0; b = 1'b1; select = 1'b0;
        #1 $monitor("%b %b %b %b", a, b, select, s);

        // Teste 2: NOR selecionado (select = 1)
        a = 1'b1; b = 1'b1; select = 1'b1;
        #1 $monitor("%b %b %b %b", a, b, select, s);

        $finish;
    end

endmodule
