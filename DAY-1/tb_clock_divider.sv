module tb;
  logic clk;
  logic rst;
  logic [3:0] count;
  logic divideby2;
  logic divideby4;
  logic divideby8;
  
  clock_divider i1 (.clk(clk), .rst(rst), .divideby2(divideby2), .divideby4(divideby4), .divideby8(divideby8), .count(count) );
  
  initial begin
    $dumpfile("clock_divider.vcd");
    $dumpvars(0, tb);
    #100;
    $finish;
  end
  
  initial begin
    clk = 0;
    rst = 0;
    #10;
    
    rst = 1;
    forever begin
      #5 clk = ~clk;
    end
  end
  
  always @(posedge clk) begin
    $display("at Time %t, count = %0b |  clk = %0b | divideby2 = %0b | divideby4 = %0b | divideby8 = %0b", $time, count, clk, divideby2, divideby4, divideby8); 
  end
endmodule
