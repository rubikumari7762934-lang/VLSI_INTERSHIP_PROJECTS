module tb;
    reg clk, reset, tx_start;
    reg [7:0] data_in;
    wire tx_pin;

    uart_tx dut (clk, reset, tx_start, data_in, tx_pin);

    always #5 clk = ~clk; // Clock generation

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, tb);
        clk = 0; reset = 1; tx_start = 0; data_in = 8'hAA;
        #10 reset = 0;
        #10 tx_start = 1;
        #10 tx_start = 0;
        #200 $finish;
    end
endmodule
