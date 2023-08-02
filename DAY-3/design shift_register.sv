module shift_register (
  input logic clk,
  input logic reset,
  input wire serial_input,
  output logic [3:0] out,
  output logic [3:0] shift_r_ff,
  output logic [3:0] next_shift_register
);

  always_ff @(posedge clk or negedge reset) begin
    if(reset)
      shift_r_ff <= 1'b0;
    else
      shift_r_ff <= next_shift_register;

    assign next_shift_register = {shift_r_ff[2:0] , serial_input};
    assign out = shift_r_ff;
  end

endmodule : shift_register
