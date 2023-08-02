module tb;
  logic clk;
  logic reset;
  logic [7:0] counter_out;
  
  odd_counter i1 (.clk(clk), .reset(reset), .counter_out(counter_out) );
  
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end
  
  initial begin
    $dumpfile("odd_counter.vcd");
    $dumpvars(0, tb);
  end
  
  initial begin
    reset <= 1'b1;
    @(posedge clk);
    @(posedge clk);
    reset <= 1'b0;
    for (int i=0;i<128;i++) begin
      @(posedge clk);
    end
    $finish();
  end
  
  always begin
    $display("At time = %0dns | reset = %0b | counter_out = %0b", $time, reset, counter_out);
  end
  
endmodule
