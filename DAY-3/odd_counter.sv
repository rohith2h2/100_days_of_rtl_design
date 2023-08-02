module odd_counter (
  input  logic clk,
  input  logic reset,
  output logic [7:0] counter_out
);
  logic [7:0] next_count;

  always_ff @(posedge clk or posedge reset) begin
    if(reset)
      counter_out <= 8'h1;
    else 
      counter_out <= next_count;

  assign next_count = counter_out + 8'h2;
  end

endmodule:odd_counter
  
