module IFID(clk, reset, PC_In, Inst_input,	Inst_output, PC_Out, IFID_Write);
  
  input wire clk;
  input reset;
  input wire [63:0] PC_In;
  input  [31:0] Inst_input;
  input IFID_Write;
  output reg [31:0]Inst_output;
  output reg [63:0] PC_Out;
  
  always @ (posedge clk or posedge reset)
    begin
    if (reset == 1'b1)
      begin
         PC_Out <= 0; 
         Inst_output <= 0;
      end
    else if (~IFID_Write) 
        begin
          PC_Out <= PC_Out;
          Inst_output <= Inst_output;
        end
     else 
       begin
         PC_Out = PC_In;
         Inst_output <= Inst_input;
       end
    end
endmodule
