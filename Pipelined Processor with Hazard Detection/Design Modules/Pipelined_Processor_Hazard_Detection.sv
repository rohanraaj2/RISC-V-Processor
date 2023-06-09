`include "Program_Counter.v"
`include "Adder.v"
`include "MUX.v"
`include "Instruction_Memory.v"
`include "IFID.v"
`include "IDEX.v"
`include "EXMEM.v"
`include "MEMWB.v"
`include "Instruction.v"
`include "Imm_data_gen.v"
`include "RegisterFile.v"
`include "Control_Unit.v"
`include "ALU_64_bit.v"
`include "ALU_Control.v"
`include "Branch_module.v"
`include "Data_Memory.v"
`include "Mux_control.v"
`include "stalling.v"
`include "forwarding.v"

module RISC_V_Processor(
    input clk,
    input reset,
    output reg [63:0] Init_PC_In,
    output reg [63:0] Init_PC_Out,
    output reg  [63:0] MUX1_Input1,
    output reg  [63:0] MUX1_Input2,
    output reg  [31:0] Instruction_IF,
    output reg  [31:0] Instruction_ID,
    output reg  [63:0] PC_Out_ID,
    output reg  [6:0] opcode_ID,
    output reg  [4:0] rd_ID,
    output reg  [2:0] f3_ID,
    output reg  [4:0] rs1_ID,
    output reg  [4:0] rs2_ID,
    output reg  [6:0] f7_ID,
    output reg  [63:0] imm_data_ID,
    output reg  [63:0] MUX5_Out,
    output reg  [4:0] rd_WB,
    output reg  [63:0] Read_Data_1_ID,
    output reg  [63:0] Read_Data_2_ID,
    output reg  RegWrite_WB,
    output reg  [1:0] ALUOp_ID,
    output reg  Branch_ID,
    output reg  MemRead_ID,
    output reg  MemtoReg_ID,
    output reg  MemWrite_ID,
    output reg  ALUSrc_ID,
    output reg  RegWrite_ID,
    output reg  Branch_EX,
    output reg  MemRead_EX,
    output reg  MemtoReg_EX,
    output reg  MemWrite_EX,
    output reg  ALUSrc_EX,
    output reg  RegWrite_EX,
    output reg  [63:0] Read_Data_1_EX,
    output reg  [63:0] Read_Data_2_EX,
    output reg  [63:0] PC_Out_EX,
    output reg  [1:0] ALUOp_EX,
    output reg  [63:0] imm_data_EX,
    output reg  [3:0] Funct_EX,
    output reg  [4:0] rs1_EX,
    output reg  [4:0] rs2_EX,
    output reg  [4:0] rd_EX,
    output reg  [3:0] Operation_EX,
    output reg  [63:0] shift_Left_out,
    output reg  [63:0] Branch_Adder_Out_EX,
    output reg  [63:0] MUX_out_EX,
    output reg  [63:0] Result_EX,
    output reg  Zero_EX,
    output reg  pos_EX,
    output reg  RegWrite_MEM,
    output reg  MemtoReg_MEM,
    output reg  MemWrite_MEM,
    output reg  MemRead_MEM,
    output reg  Branch_MEM,
    output reg  Zero_MEM,
    output reg  [63:0] Result_MEM,
    output reg  [63:0] Branch_Adder_Out_MEM,
    output reg  [63:0] Read_Data_2_MEM,
    output reg  [4:0] rd_MEM,
    output reg  pos_MEM,
    output reg  to_branch_MEM,
    output reg  blt_MEM,
    output reg  bge_MEM,
    output reg  bne_MEM,
    output reg  beq_MEM,
    output reg  [2:0] funct3_MEM,
    output reg  [63:0] Read_Data_MEM,
    output reg  MemtoReg_WB,
    output reg  [63:0] Read_Data_WB,
    output reg  [63:0]Result_WB,
    output reg  PC_Write,
    output reg  MUX_Write,
    output reg  IFID_Write,
    output reg  [1:0] Forward_A,
    output reg  [1:0] Forward_B);
  
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
    
    
    Program_Counter p1(clk, reset, PC_Write, Init_PC_In, Init_PC_Out);
    Adder a1(Init_PC_Out, 64'd4, MUX1_Input1);
    MUX m1(MUX1_Input1,MUX1_Input2, to_branch_MEM, Init_PC_In);
    Instruction_Memory i1(Init_PC_Out, Instruction_IF);
    
    IFID i2(clk, reset, Init_PC_Out, Instruction_IF, Instruction_ID, PC_Out_ID, IFID_Write);
    
    Instruction i3(Instruction_ID, opcode_ID, rd_ID, f3_ID, rs1_ID, rs2_ID, f7_ID);
    Imm_data_gen i4(Instruction_ID, imm_data_ID);  
    
    
    stalling stall(rd_ID, rs1_ID, rs2_ID, MemRead_ID, PC_Write, MUX_Write, IFID_Write);
    
    
    
    RegisterFile r1(clk, reset, rs1_ID, rs2_ID, rd_WB, MUX5_Out, RegWrite_WB, Read_Data_1_ID, Read_Data_2_ID);
    Control_Unit c1(opcode_ID, ALUOp_ID, Branch_ID, MemRead_ID, MemtoReg_ID, MemWrite_ID, ALUSrc_ID, RegWrite_ID);
    
    Mux_control mc(Mux_Write, Branch_ID, MemRead_ID, MemtoReg_ID, MemWrite_ID, ALUSrc_ID, RegWrite_ID, ALUOp_ID);
    
    
    IDEX i5(clk, reset, {Instruction_ID[30], Instruction_ID[14:12]}, ALUOp_ID, MemtoReg_ID, RegWrite_ID, Branch_ID, MemWrite_ID, MemRead_ID, ALUSrc_ID, Read_Data_1_ID, Read_Data_2_ID, rd_ID, rs1_ID, rs2_ID, imm_data_ID, PC_Out_ID, PC_Out_EX, Funct_EX, ALUOp_EX, MemtoReg_EX, RegWrite_EX, Branch_EX, MemWrite_EX, MemRead_EX, ALUSrc_EX, Read_Data_1_EX, Read_Data_2_EX, rs1_EX, rs2_EX, rd_EX, imm_data_EX);
    
    ALU_Control a2(ALUOp_EX, Funct_EX, Operation_EX);
    Adder a3(PC_Out_EX, imm_data_EX << 1, Branch_Adder_Out_EX);
    MUX m2(Read_Data_2_EX, imm_data_EX, ALUSrc_EX, MUX_out_EX);
    ALU_64_bit a4(Read_Data_1_EX, MUX_out_EX, Operation_EX, Zero_EX, Result_EX, pos_EX);
    EXMEM e1(clk, reset, rd_EX, Branch_EX, MemWrite_EX, MemRead_EX, MemtoReg_EX, RegWrite_EX, Branch_Adder_Out_EX, Result_EX, Zero_EX, Read_Data_2_EX, Read_Data_2_MEM, Branch_Adder_Out_MEM, rd_MEM, Branch_MEM, MemWrite_MEM, MemRead_MEM, MemtoReg_MEM, RegWrite_MEM, Result_MEM, Zero_MEM);
    
    branch_module b1(Zero_MEM, pos_MEM, Branch_MEM, funct3_MEM, bne_MEM, beq_MEM, bge_MEM, blt_MEM, to_branch_MEM);
    
    Data_Memory d1(clk, Result_MEM, Read_Data_2_MEM, MemWrite_MEM, MemRead_MEM, Read_Data_MEM, funct3_MEM);
    
    MEMWB m0(clk, reset, Result_MEM, Read_Data_MEM, rd_MEM, MemtoReg_MEM, RegWrite_MEM, MemtoReg_WB, RegWrite_WB, Result_WB, Read_Data_WB, rd_WB);              
    forwarding ff(
    .EX_MEM_rd(rd_MEM),
    .MEM_WB_rd(rd_WB),
    .ID_EX_rs1(rs1_EX),
    .ID_EX_rs2(rs2_EX),
    .EX_MEM_RegWrite(RegWrite_MEM),
    .MEM_WB_RegWrite(RegWrite_WB),
    .forward_A(Forward_A),
    .forward_B(Forward_B)
    );
    MUX m5(Result_WB, Read_Data_WB, MemtoReg_WB, MUX5_Out);
endmodule