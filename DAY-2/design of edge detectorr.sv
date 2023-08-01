//edge detector module

module edge_detector(
  input logic clk,
  input logic reset,
  input logic a_i,
  output wire rising_edge,
  output wire falling_edge
);
  logic a_ff;
//declaring flip flop module
  always_ff @(posedge clk or posedge reset) begin 
    if(reset)
      a_ff <= 1'b0;
    else 
      a_ff <= a_i;
  end
  //a_ff hold value of a_i from previous clock cycle 'cuz of d_ff logic in always_ff, so if a_ff is low and a_i is high, means a_i has
  //transitioned from low to high, since last clock cycle, which means rising edge, so rising edge will be 1 from below bitwise AND op
  assign rising_edge = ~(a_ff) & a_i;
//here checks for a_ff is high and a_i is low, so a_i is transitioned from high to low since last clock cycle, which is falling edge
  assign falling_edge = a_ff & ~(a_i);

endmodule:edge_detector
