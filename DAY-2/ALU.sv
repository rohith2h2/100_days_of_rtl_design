//simple ALU module with different operations like ADD, SUB, leftshift... which are selected using a case statement 

module ALU (
  input logic [7:0] a,
  input logic [7:0] b,
  input logic [2:0] sel,
  output logic [7:0] out
);
  
  localparam ADD = 3'b000;
  localparam SUB = 3'b001;
  localparam leftshift = 3'b010;
  localparam rightshift = 3'b011;
  localparam AND = 3'b100;
  localparam OR = 3'b101;
  localparam XOR = 3'b110;
  localparam equal = 3'b111;
  logic carry;
  
  always_comb begin
    case(sel)
      ADD : {carry, out} = {1'b0 , a} + {1'b0 , b};
      SUB : out = a - b;
      leftshift : out = a[7:0] << b[2:0]; //performing left shift op on a, using least significant 3 bits of b (so the 3 bits of b are used
      //to specify the no of bits to shift, which is multiply a with 2^N, a*2^N n is no of bit position shifted
      rightshift : out = a[7:0] >> b[2:0];//performing right shift on a using least significant 3 bit of b, which is dividing with a, a/2^N
      AND : out = a & b;
      OR : out = a | b;
      XOR : out = a ^ b;
      equal : out = {7'b0 , a == b}; //checks if equal then returns 7 bits of 0 and 1, which is 1, else 0
    endcase
  end
endmodule
