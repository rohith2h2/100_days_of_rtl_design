//testbench module for ALU
module tb;
  logic [7:0] a;
  logic [7:0] b;
  logic [2:0] sel;
  logic [7:0] out;
  
  ALU i1 (.a(a), .b(b), .sel(sel), .out(out) );
  
  initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0, tb);
  end
  
  initial begin
    for (int j=0;j<3; j++) begin
      for (int i = 0; i<7; i++) begin
        a = $urandom_range(0, 8'hFF);
        b = $urandom_range(0, 8'hFF);
        sel = 3'(i);
        #2;
        $display ("AT time : %0dns a = %0b | b =%0b | sel = %0b | out = %0b",$time, a, b, sel, out); 
        #5;
        $display(" \n next phase");
      end
    end
  end
endmodule
