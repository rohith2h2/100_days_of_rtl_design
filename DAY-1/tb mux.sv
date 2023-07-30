//verification of mux2to1

module tb;
  logic [7:0] a;
  logic [7:0] b;
  logic [7:0] out;
  logic sel;
  
  //Instantiate RTL
  mux2to1 i1 (.a(a), .b(b), .out(out), .sel(sel) );
  
  //drive stimulus
  initial begin
    
    for(int i =0 ; i<10; i++) begin
      a = $urandom_range (0 , 8'hFF);
      b = $urandom_range (0 , 8'hFF);
      sel = $random%2;
      #5;
    end
  end
  
  initial begin
    $dumpfile("mux2to1.vcd");
    $dumpvars(0, tb);
  end
  
endmodule
