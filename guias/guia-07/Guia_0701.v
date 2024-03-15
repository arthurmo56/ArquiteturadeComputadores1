// -------------------------
// Guia 0701 
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module test_Guia_0701;

    reg a;
    reg b;
    reg select;
    wire s1;
    wire s2;
    wire selected_output;

    // Instanciar a unidade lógica (LU) para teste
    Guia_0701 myLU (
        .s1(s1),
        .s2(s2),
        .selected_output(selected_output),
        .a(a),
        .b(b),
        .select(select)
    );

    // Inicialização
    initial begin
        $display("Guia_0701 - Teste da Unidade Lógica");
        $display(" a b select s1 s2 selected_output");

        // Teste 1: AND selecionado (select = 0)
        a = 1'b0; b = 1'b1; select = 1'b0;
        #1 $monitor("%b %b %b %b %b %b", a, b, select, s1, s2, selected_output);

        // Teste 2: NAND selecionado (select = 1)
        a = 1'b1; b = 1'b1; select = 1'b1;
        #1 $monitor("%b %b %b %b %b %b", a, b, select, s1, s2, selected_output);

        $finish;
    end

endmodule
