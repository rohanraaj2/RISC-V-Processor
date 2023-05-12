`timescale 1ns / 1ps

module Pipelined_RISC_V_tb();

    reg clk, reset;
    wire [63:0] PC_In, PC_Out, Adder1Out, Adder2Out, Imm, WriteData, ReadData1, ReadData2, Result, Read_Data;
    wire [63:0] MuxmidOut;
    wire [31:0] Instruction;
    wire [6:0] Opcode, Funct7;
    wire [4:0] RD, RS1, RS2;
    wire [3:0] Funct, Operation;
    wire [2:0] Funct3;
    wire [1:0] ALUOp;
    wire Branch, MemRead, MemWrite, MemtoReg, RegWrite, ALUSrc, Zero, sel_Branch;
    
    wire [63:0] IFID_PC_Out;
    wire [31:0] IFID_Instruction;
    
    wire IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite, IDEX_ALUSrc,
    EM_Branch, EM_MemRead, EM_MemWrite, EM_MemtoReg, EM_RegWrite, EM_Zero,
    MW_MemtoReg, MW_RegWrite;
    wire [1:0] IDEX_ALUOp;
    wire [3:0] IDEX_Funct;
    wire [4:0] IDEX_RS1, IDEX_RS2, IDEX_RD, EM_RD, MW_RD;
    wire [63:0] IDEX_PC_Out, IDEX_ReadData1, IDEX_ReadData2, IDEX_Imm,
                EM_Adder2Out, EM_Result, EM_WriteData, MW_Result, MW_Read_Data;

    RISC_V_Pipelined riscv(clk, reset,PC_In, PC_Out, Adder1Out, Adder2Out, Imm, WriteData, ReadData1, ReadData2, Result, Read_Data,MuxmidOut,Instruction,Opcode, Funct7,RD, RS1, RS2,Funct, Operation,Funct3,ALUOp,Branch, MemRead, MemWrite, MemtoReg, RegWrite, ALUSrc, Zero, sel_Branch,IFID_PC_Out,IFID_Instruction,IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite, IDEX_ALUSrc,EM_Branch, EM_MemRead, EM_MemWrite, EM_MemtoReg, EM_RegWrite, EM_Zero,MW_MemtoReg, MW_RegWrite,IDEX_ALUOp,IDEX_Funct,IDEX_RS1, IDEX_RS2, IDEX_RD, EM_RD, MW_RD,IDEX_PC_Out, IDEX_ReadData1, IDEX_ReadData2, IDEX_Imm,EM_Adder2Out, EM_Result, EM_WriteData, MW_Result, MW_Read_Data);

    initial 
        begin
            clk = 1'b0; reset = 1'b0;
            #10 reset = 1'b1;
            #10 reset = 1'b0;
        end

    always
        #10 clk = ~clk;

endmodule

