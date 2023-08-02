module tb;
  logic a;
  logic b;
  logic cin;
  logic sum;
  logic carry;
  
  full_adder i1 (.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry) );
  
  initial begin   
    for(int i = 0; i<16; i++) begin
      a = $random%2;
      b = $random%2;
      cin = $random%2;
      #5;
      $display ("At time = %0dns | a = %0b | b = %0b | cin = %0b | sum = %0b | carry = %0b",$time, a, b, cin, sum, carry);
    end
    $finish();
  end
  
  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0, tb);
  end
  
endmodule
