module mux8to1(
  input logic D0,
  input logic D1,
  input logic D2,
  input logic D3,
  input logic D4,
  input logic D5,
  input logic D6,
  input logic D7,
  input logic S1,
  input logic S2,
  input logic S3,
  output logic out
);
  always_comb begin
    case(S1&S2&S3) 
      3'b000 : out = D0;
      3'b001 : out = D1;
      3'b010 : out = D2;
      3'b011 : out = D3;
      3'b100 : out = D4;
      3'b101 : out = D5;
      3'b110 : out = D6;
      3'b111 : out = D7;
      default : out = 1'b0;
    endcase
  end

endmodule: mux8to1
