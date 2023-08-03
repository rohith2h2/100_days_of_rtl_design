/*Prompt
Given a clocked sequence of unsigned values, output the second-largest value seen so far in the sequence. If only one value is seen, then the output (dout) should equal 0. Note that repeated values are treated as separate candidates for being the second largest value.

When the reset-low signal (resetn) goes low, all previous values seen in the input sequence should no longer be considered for the calculation of the second largest value, and the output dout should restart from 0 on the next cycle.

Input and Output Signals
clk - Clock signal
resetn - Synchronous reset-low signal
din - Input data sequence
dout - Second-largest value seen so far
Output signals during reset
dout - 0 when resetn is active*/ 

module second_largest #(parameter DATA_WIDTH = 32) (
  input logic clk,
  input logic resetn,
  input logic [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);
  logic [DATA_WIDTH-1] max1, max2;

  always_ff @(posedge clk) begin
    if(!resetn) begin
      max1 <= 0;
      max2 <= 0;
    end else if ((din > max1 && din > max2)) begin //checking for largest number among max1 and max2 with din, if true max1 will be updated
      max1 <= din;
      max2 <= max1; //as din is largest, second largest will be max1, so din is assigned to max1 and max1 to din
    end else if (din > max2) begin //what if din is largest than max2 but not max1, then found second largest in din and updating max2
      max2 <= din;
    end
  end
  assign dout = max2;

endmodule: second_largest
