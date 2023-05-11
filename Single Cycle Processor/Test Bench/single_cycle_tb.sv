module tb();
  reg dclk;
  reg dreset;
  wire [63:0] Index_0;
  wire [63:0] Index_1;
  wire [63:0] Index_2;
  wire [63:0] Index_3;
  wire [63:0] Index_4;
  wire [63:0] Index_5;
  wire [63:0] Index_6;
  wire [63:0] Index_7;
  wire [63:0] Index_8;
  wire [63:0] Index_9;
  
  Single_Cycle_Processor r1(dclk, dreset, Index_1,
  Index_2,
  Index_3,
  Index_4,
  Index_5,
  Index_6,
  Index_7,
  Index_8,
  Index_9);
  
  initial 
    begin
    	dclk = 1'b0;
  end
  
  always 
    begin
    #5
    dclk = ~dclk;
  	end
  initial 
    begin
      dreset = 1'b1;
      #10
      dreset = 1'b0;
      #4000
      dreset = 1'b1;
      $finish;
  	end
  
  initial begin
    $dumpfile("tests.vcd");
    $dumpvars();
    #100000 $finish;
  end
endmodule
