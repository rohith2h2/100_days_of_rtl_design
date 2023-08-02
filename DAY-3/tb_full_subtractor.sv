module tb;
  logic a;
  logic b;
  logic bin;
  logic diff;
  logic borrow;
  
  full_subtractor i1 (.a(a), .b(b), .bin(bin), .diff(diff), .borrow(borrow) );
  
  initial begin
    $dumpfile("full_subtractor.vcd");
    $dumpvars(0, tb);
  end
  
  initial begin
    for(int i =0 ;i<10; i++) begin
      a = $urandom%2;
      #1;
      b = $urandom%2;
      #1;
      bin = $urandom%2;
      #5;
      $display ("At Time = %0dns | a = %0b | b = %0b | bin = %0b | diff = %0b | borrow = %0b", $time, a, b, bin, diff, borrow);
    end
    $finish();
  end
  
endmodule
