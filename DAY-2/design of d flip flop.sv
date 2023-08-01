//here we have defined different types of d flip flop, without reset, with reset (synchronous and asynchronous) 

module d_flip_flop(
  input logic clk,
  input logic reset,
  input logic d_i,
  output logic q_o_noreset,
  output logic q_o_synreset,
  output logic q_o_asynreset
);

  //d flip flop without reset option, at every positive edge of clock, q will capture d value
  always_ff @(posedge clk)
    q_o_noreset <= d_i;

  //d flip flop with synchronous reset, reset happens only at rising clock edge when the reset signal is high
  always_ff @(posedge clk) begin
    if(reset)
      q_o_synreset <= 1'b0;
    else
      q_o_synreset <= d_i;
  end

  //d flip flop with asynchronous reset, reset happens immediately when reset signal goes high, regardless of clock signal
  always_ff @(posedge clk or negedge reset) begin
      if(reset)
        q_o_asynreset <= 1'b0;
      else 
        q_o_asynreset <= d_i;
    end
endmodule : d_flip_flop

