module tb;
  parameter DATA_WIDTH = 32;
  logic clk;
  logic resetn;
  logic [DATA_WIDTH-1:0] din;
  logic [DATA_WIDTH-1:0] dout;
  
  second_largest #(.DATA_WIDTH(DATA_WIDTH)) i1 (.clk(clk), .resetn(resetn), .din(din), .dout(dout) );
  
  initial begin
    $dumpfile("second_largest.vcd");
    $dumpvars(0, tb);
  end
  
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end
  
  initial begin
    resetn = 1'b0;
    #10
    resetn = 1'b1;
    #20
    din = 4;
    #20;
    if (dout !== 0) begin
      $display("Test Case 1 failed: Expected dout = 0");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    else begin
      $display("Test Case 1 passed");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    
    #10;

    // Test Case 2: Single non-zero input
    din = 42;
    #20;
    if (dout !== 0) begin
      $display("Test Case 2 failed: Expected dout = 0");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    else begin
      $display("Test Case 2 passed");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    #10;

    // Test Case 3: Multiple non-zero inputs
    din = 17;
    #20;
    if (dout !== 17) begin
      $display("Test Case 3 failed: Expected dout = 17");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    else begin
      $display("Test Case 3 passed");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    #10;
    
    din = 29;
    #20;
    if (dout !== 17) begin
      $display("Test Case 4 failed: Expected dout = 17");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    else begin
      $display("Test Case 4 passed");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    #10;

    din = 33;
    #20;
    if (dout !== 29) begin
      $display("Test Case 5 failed: Expected dout = 29");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    else begin
      $display("Test Case 5 passed");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    #10;

    din = 22;
    #20;
    if (dout !== 29) begin
      $display("Test Case 6 failed: Expected dout = 29");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    else begin
      $display("Test Case 6 passed");
      $display("At time = %d0ns, din = %0d  | dout = %0d", $time, din, dout);
    end
    #10;

    $finish;
  end
  
endmodule
