//design parameterized binary to one hot converter

module binary2onehot #(
  parameter bin_width = 4,
  parameter onehot_width = 16
) ( 
  input logic [bin_width-1:0] bin_in,
  output logic [onehot_width-1:0] onehot_out
);
  assign onehot_out = 1 << bin_in; //here onehot is representation of binary value with only 1 and all remaining value are 0, that one is the 
  //position of binary value.
  //suppose binary 11 whhihc is 3, in onehot it would be 1000, 1 at position 3 indicates the value 3. for this we take 1'b1,and we left shift
  //that by the bin_in provided.

endmodule:binary2onehot
