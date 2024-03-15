// -------------------------
// Guia 1402
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module shift_left_reg_all_load (
    input wire clk,
    input wire reset,
    input wire load,
    input wire [5:0] in_data,
    output reg [5:0] out_data
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            out_data <= 6'b0;
        else if (load)
            out_data <= in_data;
        else
            out_data <= {out_data[4:0], 1'b0};
    end

endmodule
