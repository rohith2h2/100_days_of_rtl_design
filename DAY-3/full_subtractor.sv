module full_subtractor(
  input logic a,
  input logic b,
  input logic bin,
  output logic diff,
  output logic borrow
);

  assign diff = a ^ b ^ bin;
  assign borrow = ~a & b | b & bin | bin & a;

endmodule
