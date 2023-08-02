module tb;
  logic a;
  logic [2:0] sel;
  logic [7:0] y;
  
  demux1to8 i1 (.a(a) ,.sel(sel), .y(y) );
  
  initial begin
    for(int i = 0; i<19; i++) begin
      a = 1'b1;
      sel = $urandom_range(0,7);
      #5;
      $display("At time = %0dns | a = %0b | sel = %0b | out = %0b", $time, a, sel, y);
      #5;
    end
    $finish();
  end
  
  initial begin
    $dumpfile("demux1to8.vcd");
    $dumpvars(0, tb);
  end
  
endmodule
