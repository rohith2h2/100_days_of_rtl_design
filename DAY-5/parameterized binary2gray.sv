module binary2gray(
  #( VEC_WIDTH = 4)
  input logic [VEC_WIDTH-1:0] bin_in,
  output logic [VEC_WIDTH-1:0] gray_out
);
  assign gray_out[VEC_WIDTH-1] = bin_in[VEC_WIDTH-1];
//binary2gray, the MSB for both will be same, so above statement takes care of that
  //now from there MSB-1 element of gray will be xor of MSB of binary and its next element. so below we are declaring i and using it to assign gray_out
  genvar i;
  for(i=VEC_WIDTH-2; i>0; i--) begin
    assign gray_out[i] = bin_in[i+1] ^ bin_in[i] ;
  end
endmodule:binar2gray
  
