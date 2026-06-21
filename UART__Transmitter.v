module uart_tx (
    input clk,
    input reset,
    input tx_start,
    input [7:0] data_in,
    output reg tx_pin
);
    // Simple UART TX logic (8 data bits, no parity, 1 stop bit)
    reg [3:0] bit_count;
    reg [7:0] shift_reg;
    reg sending;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tx_pin <= 1'b1;
            sending <= 1'b0;
            bit_count <= 4'd0;
        end else if (tx_start && !sending) begin
            shift_reg <= data_in;
            sending <= 1'b1;
            tx_pin <= 1'b0; // Start bit
        end else if (sending) begin
            if (bit_count < 8) begin
                tx_pin <= shift_reg[bit_count];
                bit_count <= bit_count + 1;
            end else begin
                tx_pin <= 1'b1; // Stop bit
                sending <= 1'b0;
                bit_count <= 4'd0;
            end
        end
    end
endmodule
