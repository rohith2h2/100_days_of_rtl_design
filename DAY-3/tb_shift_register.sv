module tb;
  logic clk;
  logic reset;
  logic [3:0] out;
  logic serial_input;
  logic [3:0] shift_r_ff;
  logic [3:0] next_shift_register;
  
  shift_register i1 (.clk(clk), .reset(reset), .out(out), .serial_input(serial_input), .shift_r_ff(shift_r_ff), .next_shift_register(next_shift_register) );
  
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end
  
  initial begin
    $dumpfile("shift_register.vcd");
    $dumpvars(0, tb);
  end
  
  initial begin
    reset <= 1'b1;
    serial_input <= 1'b0;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    for(int i=0; i<32; i++) begin
      serial_input <= $random%2;
      @(posedge clk);
      #1;
      $display( "AT time = %0dns | reset = %0b | serial_input = %0b | shift_r_ff = %0b | next_shift_register = %0b | out = %0b", $time, reset, serial_input, shift_r_ff, next_shift_register, out);
    end
    $finish();
  end
  
endmodule
