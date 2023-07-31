// Binary to gray code converter using combinational logic
//gray code is binary numeral system where two successive values differ in only one bit
//conversion from binary to gray code involves taking MSB of gray code as it from binary number. remaining bits of gray code are found by exclusive OR of current bit and next higher bit of binary number
module bin2gray #(parameter WIDTH = 32 )(
  input logic [WIDTH-1:0] binary_in,
  output logic [WIDTH-1:0] gray_out
);
  
  always_comb begin
    gray_out[WIDTH-1:0] = binary_in[WIDTH-1:0] ^ (binary_in[WIDTH-1:0] >> 1) ;
  end
  
endmodule
