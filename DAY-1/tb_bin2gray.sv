//
module tb;
  localparam WIDTH = 32;
  logic [WIDTH-1: 0] binary_in;
  logic [WIDTH-1: 0] gray_out;
  
  //Instantiate RTL
  bin2gray #(WIDTH) i1 (.binary_in(binary_in), .gray_out(gray_out) );
  
  initial begin
    $dumpfile("bin2gray.vcd");
    $dumpvars(0, tb);
  end
  
  initial begin
    for(binary_in= 0; binary_in < (WIDTH); binary_in = binary_in +1) begin
      #1
      $display("At time = %t, binary_in = %0b | gray_out = %0b", $time, binary_in, gray_out );
    end
    #10
    $finish;
  end
endmodule
  
