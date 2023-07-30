
// design of mux 2 to 1 module
//mux is combinational circuit that selects binary info from one of many //input lines, and directs it into single output line. mux with m //selection line controls 2^m input lines.

module mux2to1(
  input logic [7:0] a,//8 bit wide
  input logic [7:0] b,
  input logic sel, //one select line
  output logic [7:0] out //one output line
);
  always_comb begin //used when output is purely function of its current //input, with no memory of previous inputs or behaviour
    case(sel) //case is used to implement selection logic, checks value //sel and performs assignment to out
      1'b0 : out = a;
      1'b1 : out = b;
      default : out = 8'b0;
    endcase
  end
  
endmodule:mux2to1
