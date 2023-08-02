module odd_counter (
  input  logic clk,
  input  logic reset,
  output logic [7:0] counter_out
);
  logic [7:0] next_count;

  always_ff @(posedge clk or posedge reset) begin
    if(reset) //when reset is high 1 is assigned to counter_out
      counter_out <= 8'h1;
    else //when resest is low, next_count is assigned to counter_out
      counter_out <= next_count;
//At rising edge of clk, 2 will be added with counter_out, assigning a odd value to next_count
  assign next_count = counter_out + 8'h2;
  end

endmodule:odd_counter
  
