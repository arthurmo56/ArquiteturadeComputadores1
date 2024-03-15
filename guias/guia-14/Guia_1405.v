// -------------------------
// Guia 1405
// Nome: Arthur Martinho Medeiros Oliveira
// Matricula: 813168
// -------------------------
module parallel_to_serial_converter (
    input wire clk,
    input wire [5:0] parallel_data,
    input wire load,
    output reg serial_data
);

    always @(posedge clk) begin
        if (load)
            serial_data <= parallel_data[5];
        else
            serial_data <= {serial_data, parallel_data[5]};
    end

endmodule
