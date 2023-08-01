module tb;
  logic clk;
  logic reset;
  logic a_i;
  logic rising_edge;
  logic falling_edge;
  logic a_ff;
  
  //instantiate
  edge_detector i1 (.clk(clk), .reset(reset), .a_i(a_i), .rising_edge(rising_edge), .falling_edge(falling_edge), .a_ff(a_ff) );
  
  initial begin
    $dumpfile("edge_detector.vcd");
    $dumpvars(0, tb);
  end
  
  always begin
    #5;
    clk = 1'b1;
    #5;
    clk = 1'b0;
  end
  
  always @(posedge clk) begin
    $display ("At time : %0dns | reset = %0b | a_i = %0b | a_ff = %0b | rising_edge = %0b | falling_edge = %0b", $time, reset, a_i, a_ff, rising_edge, falling_edge);
  end
  
  initial begin
    reset <= 1'b1;
    a_i <= 1'b1;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    for(int i = 0; i<32; i=i+1) begin
      a_i <= $random%2;
      @(posedge clk);
    end
    $finish();
  end
  
endmodule
