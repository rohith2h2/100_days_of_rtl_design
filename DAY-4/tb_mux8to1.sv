module tb;
  logic D0;
  logic D1;
  logic D2;
  logic D3;
  logic D4;
  logic D5;
  logic D6;
  logic D7;
  logic S1;
  logic S2;
  logic S3;
  logic out;
  
  mux8to1 i1(.*);
  
  initial begin
    $dumpfile("mux8to1.vcd");
    $dumpvars(0, tb);
  end
  
  initial begin
    for(int i= 0; i<10; i++) begin
      S1 = $random%2;
      S2 = $random%2;
      S3 = $random%2;
      #5
      $display("At time = %0dns, S1 = %0b | S2 = %0b | S3 = %0b | out = %0b",$time, S1, S2, S3, out);
    end
    $finish();
  end
  
endmodule
