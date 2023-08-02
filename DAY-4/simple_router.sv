/* simple router module, Build a router circuit which forwards data from the input (din) to one of four outputs (dout0, dout1, dout2, or dout3), specified by the address input (addr).

The address is a two bit value whose decimal representation determines which output value to use. Append to dout the decimal representation of addr to get the output signal name dout{address decimal value}. For example, if addr=b11 then the decimal representation of addr is 3, so the output signal name is dout3.

The input has an enable signal (din_en), which allows the input to be forwarded to an output when enabled. If an output is not currently being driven to, then it should be set to 0.

Input and Output Signals
din - Input data.
din_en - Enable signal for din. Forwards data from input to an output if 1, does not forward data otherwise.
addr - Two bit destination address. For example addr = b11 = 3 indicates din should be forwarded to output value 3 (dout3).
dout0 - Output 0. Corresponds to addr = b00.
dout1 - Output 1. Corresponds to addr = b01.
dout2 - Output 2. Corresponds to addr = b10.
dout3 - Output 3. Corresponds to addr = b11.
*/

module simple_router #(parameter WIDTH = 32) (
  input logic [WIDTH-1:0] din,
  input logic din_en,
  input logic [1:0] addr,
  output logic [WIDTH-1:0] dout0,
  output logic [WIDTH-1:0] dout1,
  output logic [WIDTH-1:0] dout2,
  output logic [WIDTH-1:0] dout3
);
  always_comb begin
    if(din_en) begin //checks for din_en is high, then w.r.t addr given din is forwarded to that ouput
      assign dout0 = (addr == 0) ? din : 0;
      assign dout1 = (addr == 1) ? din : 0;
      assign dout2 = (addr == 2) ? din : 0;
      assign dout3 = (addr == 3) ? din : 0;
    end
    else begin //when din_en is low, assign 0 to all dout variable
      dout0 = 0;
      dout1 = 0;
      dout2 = 0;
      dout3 = 0;
    end
  end
endmodule : simple_router
      
