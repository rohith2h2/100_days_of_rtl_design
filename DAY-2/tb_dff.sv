module tb;
  logic clk;
  logic reset;
  logic d_i;
  logic q_o_noreset;
  logic q_o_synreset;
  logic q_o_asynreset;
  
  //instantiate rtl
  d_flip_flop i1 (.clk(clk), .reset(reset), .d_i(d_i), .q_o_noreset(q_o_noreset), .q_o_synreset(q_o_synreset), .q_o_asynreset(q_o_asynreset) );
  
  initial begin
    $dumpfile("d_flip_flop.vcd");
    $dumpvars(0, tb);
  end
  
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end
  
  initial begin
    reset = 1'b1;
    d_i = 1'b0;
    $display ("Time: %0t, Reset: %0b, D_i: %0b | q_o_noreset = %0b | q_o_synreset = %0b | q_o_asynreset = %0b", $time, reset, d_i, q_o_noreset, q_o_synreset, q_o_asynreset);
    @(posedge clk);
    
    reset = 1'b0;
    $display ("Time: %0t, Reset: %0b, D_i: %0b | q_o_noreset = %0b | q_o_synreset = %0b | q_o_asynreset = %0b", $time, reset, d_i, q_o_noreset, q_o_synreset, q_o_asynreset);
    @(posedge clk);
    
    d_i = 1'b1;
    $display ("Time: %0t, Reset: %0b, D_i: %0b | q_o_noreset = %0b | q_o_synreset = %0b | q_o_asynreset = %0b", $time, reset, d_i, q_o_noreset, q_o_synreset, q_o_asynreset);
    @(posedge clk);
    @(posedge clk);
    
    reset = 1'b1;
    $display ("Time: %0t, Reset: %0b, D_i: %0b | q_o_noreset = %0b | q_o_synreset = %0b | q_o_asynreset = %0b", $time, reset, d_i, q_o_noreset, q_o_synreset, q_o_asynreset);
    @(posedge clk);
    @(posedge clk);
    
    reset = 1'b0;
    $display ("Time: %0t, Reset: %0b, D_i: %0b | q_o_noreset = %0b | q_o_synreset = %0b | q_o_asynreset = %0b", $time, reset, d_i, q_o_noreset, q_o_synreset, q_o_asynreset);
    @(posedge clk);
    @(posedge clk);
    
    $display ("Time: %0t, Reset: %0b, D_i: %0b, Q_o_noReset: %0b, Q_o_SyncReset: %0b, Q_o_AsyncReset: %0b", $time, reset, d_i, q_o_noreset, q_o_synreset, q_o_asynreset);
    
    @(posedge clk);
    @(posedge clk);
    
    $display ("Time: %0t, Reset: %0b, D_i: %0b, Q_o_noReset: %0b, Q_o_SyncReset: %0b, Q_o_AsyncReset: %0b", $time, reset, d_i, q_o_noreset, q_o_synreset, q_o_asynreset);
    
    @(posedge clk);
    @(posedge clk);
    
    $display ("Time: %0t, Reset: %0b, D_i: %0b, Q_o_noReset: %0b, Q_o_SyncReset: %0b, Q_o_AsyncReset: %0b", $time, reset, d_i, q_o_noreset, q_o_synreset, q_o_asynreset);
    
    @(posedge clk);
    @(posedge clk);
    
    $display ("Time: %0t, Reset: %0b, D_i: %0b, Q_o_noReset: %0b, Q_o_SyncReset: %0b, Q_o_AsyncReset: %0b", $time, reset, d_i, q_o_noreset, q_o_synreset, q_o_asynreset);
    @(posedge clk);
    @(posedge clk);
    
    d_i = 1'b0;
    $display ("Time: %0t, Reset: %0b, D_i: %0b | q_o_noreset = %0b | q_o_synreset = %0b | q_o_asynreset = %0b", $time, reset, d_i, q_o_noreset, q_o_synreset, q_o_asynreset);

    
    $finish();
  end
  
  
endmodule

//At time 0, both Reset and D_i are 0, and the flip flop outputs are unknown (represented by x). This makes sense because the flip flop has not been triggered by a clock edge yet.
//At time 10, Reset has been deasserted, but D_i is still 0, so the flip flop outputs are also 0.
//At time 20, D_i has been set to 1, but the outputs are still 0 because the flip flop has not been triggered by a clock edge.
//At time 40, Reset is asserted high, so the outputs go high (to 1) as the flip flops are reset.
//At time 60, Reset is deasserted again, so the synchronous reset flip flop (q_o_synreset) goes low, while the output of the flip flop without a reset (q_o_noreset) and the one with an asynchronous reset (q_o_asynreset) remains high.
//From time 80 to 140, Reset remains deasserted and D_i remains 1, so the state of the flip flops remains the same.
//At time 160, D_i is set to 0, but the output of the flip flops remain the same because the clock edge has not arrived yet to trigger a state change in the flip flops.
