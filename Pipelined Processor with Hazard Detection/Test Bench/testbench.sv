module tb();
    reg dclk;
    reg dreset;
    wire [63:0] Init_PC_In;
    wire [63:0] Init_PC_Out;
    wire [63:0] MUX1_Input1;
    wire [63:0] MUX1_Input2;
    wire [31:0] Instruction_IF;
    wire [31:0] Instruction_ID;
    wire [63:0] PC_Out_ID;
    wire [6:0] opcode_ID;
    wire [4:0] rd_ID;
    wire [2:0] f3_ID;
    wire [4:0] rs1_ID;
    wire [4:0] rs2_ID;
    wire [6:0] f7_ID;
    wire [63:0] imm_data_ID;
    wire [63:0] MUX5_Out;
    wire [4:0] rd_WB;
    wire [63:0] Read_Data_1_ID;
    wire [63:0] Read_Data_2_ID;
    wire RegWrite_WB;
    wire [1:0] ALUOp_ID;
    wire Branch_ID;
    wire MemRead_ID;
    wire MemtoReg_ID;
    wire MemWrite_ID;
    wire ALUSrc_ID;
    wire RegWrite_ID;
    wire Branch_EX;
    wire MemRead_EX;
    wire MemtoReg_EX;
    wire MemWrite_EX;
    wire ALUSrc_EX;
    wire RegWrite_EX;
    wire [63:0] Read_Data_1_EX;
    wire [63:0] Read_Data_2_EX;
    wire [63:0] PC_Out_EX;
    wire [1:0] ALUOp_EX;
    wire [63:0] imm_data_EX;
    wire [3:0] Funct_EX;
    wire [4:0] rs1_EX;
    wire [4:0] rs2_EX;
    wire [4:0] rd_EX;
    wire [3:0] Operation_EX;
    wire [63:0] shift_Left_out;
    wire [63:0] Branch_Adder_Out_EX;
    wire [63:0] MUX_out_EX;
    wire [63:0] Result_EX;
    wire Zero_EX;
    wire pos_EX;
    wire RegWrite_MEM;
    wire MemtoReg_MEM;
    wire MemWrite_MEM;
    wire MemRead_MEM;
    wire Branch_MEM;
    wire Zero_MEM;
    wire [63:0] Result_MEM;
    wire [63:0] Branch_Adder_Out_MEM;
    wire [63:0] Read_Data_2_MEM;
    wire [4:0] rd_MEM;
    wire pos_MEM;
    wire to_branch_MEM;
    wire blt_MEM;
    wire bge_MEM;
    wire bne_MEM;
    wire beq_MEM;
    wire [2:0] funct3_MEM;
    wire [63:0] Read_Data_MEM;
    wire MemtoReg_WB;
    wire [63:0] Read_Data_WB;
    wire [63:0]Result_WB;
    
    wire PC_Write;
    wire MUX_Write;
    wire IFID_Write;
    wire [1:0] Forward_A; wire [1:0] Forward_B;
  
    RISC_V_Processor r1(dclk, dreset, Init_PC_In,Init_PC_Out,MUX1_Input1,MUX1_Input2,Instruction_IF,Instruction_ID,PC_Out_ID,opcode_ID,rd_ID,f3_ID,rs1_ID,rs2_ID,f7_ID,imm_data_ID,MUX5_Out,rd_WB,Read_Data_1_ID,Read_Data_2_ID,RegWrite_WB,ALUOp_ID,Branch_ID,MemRead_ID,MemtoReg_ID,MemWrite_ID,ALUSrc_ID,RegWrite_ID,Branch_EX,MemRead_EX,MemtoReg_EX,MemWrite_EX,ALUSrc_EX,RegWrite_EX,Read_Data_1_EX,Read_Data_2_EX,PC_Out_EX,ALUOp_EX,imm_data_EX,Funct_EX,rs1_EX,rs2_EX,rd_EX,Operation_EX,shift_Left_out,Branch_Adder_Out_EX,MUX_out_EX,Result_EX,Zero_EX,pos_EX,RegWrite_MEM,MemtoReg_MEM,MemWrite_MEM,MemRead_MEM,Branch_MEM,Zero_MEM,Result_MEM,Branch_Adder_Out_MEM,Read_Data_2_MEM,rd_MEM,pos_MEM,to_branch_MEM,blt_MEM,bge_MEM,bne_MEM,beq_MEM,funct3_MEM,Read_Data_MEM,MemtoReg_WB,Read_Data_WB,Result_WB,PC_Write,MUX_Write,IFID_Write,Forward_A, Forward_B);
  
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
    
    initial 
        begin
            $dumpfile("tests.vcd");
            $dumpvars();
            #10000 $finish;
        end
endmodule