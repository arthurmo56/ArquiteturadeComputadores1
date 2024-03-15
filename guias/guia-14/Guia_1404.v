// -------------------------
// Guia 1404
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module twisted_ring_shift_left_reg (
    input wire clk,
    input wire reset,
    input wire load,
    output reg [5:0] out_data
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            out_data <= 6'b0;
        else if (load)
            out_data <= 6'b000001;
        else
            out_data <= {out_data[4:0], out_data[5]};
    end

endmodule
