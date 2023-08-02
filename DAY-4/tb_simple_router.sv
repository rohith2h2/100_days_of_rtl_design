module tb_simple_router;
  // Parameters
  parameter WIDTH = 32; // Data width of the router
  logic din_en;
  logic [1:0] addr;
  logic [WIDTH-1:0] din;
  logic [WIDTH-1:0] dout0;
  logic [WIDTH-1:0] dout1;
  logic [WIDTH-1:0] dout2;
  logic [WIDTH-1:0] dout3;

  // Instantiate the simple_router module
  simple_router #(.WIDTH(WIDTH)) i1 (.din_en(din_en), .addr(addr), .din(din), .dout0(dout0), .dout1(dout1), .dout2(dout2), .dout3(dout3) );

  // Stimulus
  initial begin
    $dumpfile("simple_router.vcd");
    $dumpvars(0, tb_simple_router);
  end

  initial begin
    // Test Case 1: Disable forwarding (din_en = 0), All outputs should be 0
    din_en = 0;
    #10;
    if (dout0 !== 0 || dout1 !== 0 || dout2 !== 0 || dout3 !== 0)
      $display("Test Case 1 failed: Expected dout0, dout1, dout2, dout3 = 0");
    else
      $display("Test Case 1 passed");

    // Test Case 2: Forward din to dout0 (addr = 0b00)
    din = 32'b10101010;
    din_en = 1;
    addr = 2'b00;
    #10;
    if (dout0 !== din || dout1 !== 0 || dout2 !== 0 || dout3 !== 0)
      $display("Test Case 2 failed: Expected dout0 = din and dout1, dout2, dout3 = 0");
    else
      $display("Test Case 2 passed");

    // Test Case 3: Forward din to dout1 (addr = 0b01)
    din = 32'b11001100;
    addr = 2'b01;
    #10;
    if (dout0 !== 0 || dout1 !== din || dout2 !== 0 || dout3 !== 0)
      $display("Test Case 3 failed: Expected dout1 = din and dout0, dout2, dout3 = 0");
    else
      $display("Test Case 3 passed");

    // Test Case 4: Forward din to dout2 (addr = 0b10)
    din = 32'b11110000;
    addr = 2'b10;
    #10;
    if (dout0 !== 0 || dout1 !== 0 || dout2 !== din || dout3 !== 0)
      $display("Test Case 4 failed: Expected dout2 = din and dout0, dout1, dout3 = 0");
    else
      $display("Test Case 4 passed");

    // Test Case 5: Forward din to dout3 (addr = 0b11)
    din = 32'b00001111;
    addr = 2'b11;
    #10;
    if (dout0 !== 0 || dout1 !== 0 || dout2 !== 0 || dout3 !== din)
      $display("Test Case 5 failed: Expected dout3 = din and dout0, dout1, dout2 = 0");
    else
      $display("Test Case 5 passed");

    $finish;
  end
endmodule : tb_simple_router
