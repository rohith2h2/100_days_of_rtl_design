module tb;
  logic a;
  logic b;
  logic sum;
  logic carry;

  half_adder i1 (.a(a), .b(b), .sum(sum), .carry(carry) );

  initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0,tb);
  end

  initial begin
    for(int i=0; i<10; i++) begin
      a = $random%2;
      b = $random%2;
      #5;
      $display ("a = %0d | b = %0d | sum = %0d | carry = %0d", a,b,sum,carry);
    end
  end

endmodule
      

  
