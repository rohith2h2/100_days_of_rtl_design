module tb;
  parameter VEC_WIDTH = 33;
  logic [VEC_WIDTH-1:0] bin_in;
  logic [VEC_WIDTH-1:0] gray_out;
  
  binary2gray #( .VEC_WIDTH(VEC_WIDTH) ) i1 ( .bin_in(bin_in), .gray_out(gray_out) );
  
  initial begin
    $dumpfile("binary2gray.vcd");
    $dumpvars(0, tb);
  end
  
  initial begin
    bin_in = 20;
    $display("Gray value=%0b | bianry_value= = %0b",gray_out, bin_in);
    #5;
    $finish();
  end
  
endmodule
