module clock_divider #(parameter WIDTH = 4)(
  input logic clk, rst,
  output logic divideby2, divideby4, divideby8
  output logic [WIDTH-1:0] count
);
  always_ff@(posedge clk or negedge rst) begin
    if(~rst)
      count <= '0;
    else
      count <= count + 1'b1;
  end
  assign divideby2 = count[1] ;
  assign divideby4 = count[2];
  assign divideby8 = count [3] ;

endmodule : clock_divider
  
