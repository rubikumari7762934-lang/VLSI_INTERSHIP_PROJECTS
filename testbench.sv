module tb;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  // Design module ko connect karna
  adder_4bit uut (a, b, cin, sum, cout);

  initial begin
    $dumpfile("dump.vcd"); // Waveform file banane ke liye
    $dumpvars;
    
    // Test cases
    a = 4'b0010; b = 4'b0011; cin = 0; #10;
    a = 4'b1111; b = 4'b0001; cin = 0; #10;
    
    $finish;
  end
endmodule