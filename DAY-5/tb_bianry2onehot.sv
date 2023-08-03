module tb;
  parameter bin_width = 4;
  parameter onehot_width = 16;
  logic [bin_width-1:0] bin_in;
  logic [onehot_width-1:0] onehot_out;
  
  binary2onehot #( .bin_width(bin_width), .onehot_width(onehot_width)) i1 ( .bin_in(bin_in), .onehot_out(onehot_out) );
  
  initial begin
    $dumpfile("binary2onehot.vcd");
    $dumpvars(0, tb);
  end
  
  initial begin
    bin_in = 5;
    $display("onehot-out = %0b", onehot_out);
    #5;
    $finish();
  end
endmodule // tb works
