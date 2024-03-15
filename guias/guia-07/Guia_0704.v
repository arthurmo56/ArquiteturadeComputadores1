// -------------------------
// Guia 0704
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module Guia_0704 (
    output s, // Saída selecionável
    input a,  // Entrada a
    input b,  // Entrada b
    input [1:0] select_output // Chave de seleção para saída (00 para XOR, 01 para XNOR, 10 para OR, 11 para NOR)
);

wire xor_output;
wire xnor_output;
wire or_output;
wire nor_output;

//operações XOR e XNOR
xor XOR1 (xor_output, a, b);
xnor XNOR1 (xnor_output, a, b);

//operações OR e NOR
or OR1 (or_output, a, b);
nor NOR1 (nor_output, a, b);

// Selecionar a saída com base na chave de seleção de saída
assign s = (select_output == 2'b00) ? xor_output :
             (select_output == 2'b01) ? xnor_output :
             (select_output == 2'b10) ? or_output : nor_output;

endmodule

module test_Guia_0704;

    reg a;
    reg b;
    reg [1:0] select_output;
    wire s;

    // Instanciar a unidade lógica (LU) para teste
    Guia_0704 myLU (
        .s(s),
        .a(a),
        .b(b),
        .select_output(select_output)
    );

    // Inicialização
    initial begin
        $display("Guia_0704 - Teste da Unidade Lógica");
        $display(" a b select_output s");

        // Teste 1: XOR selecionado (select_output = 00)
        a = 1'b0; b = 1'b1; select_output = 2'b00;
        #1 $monitor("%b %b %b %b", a, b, select_output, s);

        // Teste 2: XNOR selecionado (select_output = 01)
        a = 1'b1; b = 1'b1; select_output = 2'b01;
        #1 $monitor("%b %b %b %b", a, b, select_output, s);

        // Teste 3: OR selecionado (select_output = 10)
        a = 1'b0; b = 1'b0; select_output = 2'b10;
        #1 $monitor("%b %b %b %b", a, b, select_output, s);

        // Teste 4: NOR selecionado (select_output = 11)
        a = 1'b1; b = 1'b0; select_output = 2'b11;
        #1 $monitor("%b %b %b %b", a, b, select_output, s);

        $finish;
    end

endmodule
