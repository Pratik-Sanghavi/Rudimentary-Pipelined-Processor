// PROCESSOR DATAPATH AND CONTROL
// In this module we will make the internal connections between modules to implement the single cycle implementation
// All control signals will be brought from the main control unit

module Processor(clk, reset);

// Declare the inputs
input clk;
input reset;

// Declare the intermediate signals
// (1) From and into Instruction_Fetch Unit
wire [7:0] Instruction_Code;

// (2) From IF/ID Register File
wire [7:0] Instruction_Coden;

// (3) From Main_Control_Unit
wire RegWrite;
wire ALU_Src;
wire ALU_op;

// (4) From and into Instruction_Decode Unit
wire RegWritenn;
wire [7:0] Write_Data;
wire [7:0] Read_Data_1;
wire [7:0] Read_Data_2;
wire [7:0] Gen_Imm_Data;
wire [2:0] Write_Register_Num;


// (5) From ID/EX Register File
wire [2:0] Instruction_Codenr1;
wire [2:0] Instruction_Codenr2;
wire [7:0] Read_Data_1n;
wire [7:0] Read_Data_2n;
wire [7:0] Gen_Imm_Datan;
wire [2:0] Instruction_Codenn1;
wire [2:0] Instruction_Codenn2;
wire RegWriten;
wire ALU_Srcn;
wire ALU_opn;
wire DH_Det1;
wire DH_Det2;

assign Instruction_Codenr1=Instruction_Coden[5:3];
assign Instruction_Codenr2=Instruction_Coden[2:0];

// (6) From Execution_Unit
wire [7:0] ALU_result;
wire [7:0] Read_Dat_1n;
wire [7:0] Read_Dat_2n;

// (7) From EX/WB Register File
wire [7:0] ALU_resultn;
wire [2:0] Instruction_Codennn;

// (8) From Write_Back_Unit
// No signal as all signals have been dealt with in the preceding stages

//Instantiate Instruction_fetch Unit 
Instruction_Fetch IF(clk, reset, Instruction_Code);

//Instantiate the IF/ID Register File
IF_ID_Register_File IF_ID(clk, reset, Instruction_Code, Instruction_Coden);

// Instantiate the Main_Control_Unit
Main_Control_Unit MCU(Instruction_Coden, RegWrite, ALU_Src, ALU_op);

//Instantiate Instruction_Decode Unit
Instruction_Decode ID(clk, reset, Instruction_Coden, RegWritenn, Write_Data, Write_Register_Num, Read_Data_1, Read_Data_2, Gen_Imm_Data);

//Instantiate the ID_EX_Register_File
ID_EX_Register_File ID_EX(clk, reset, Read_Data_1,Read_Data_2,Gen_Imm_Data, Instruction_Codenr1,Instruction_Codenr2, RegWrite, ALU_Src, ALU_op, Read_Data_1n,Read_Data_2n,Gen_Imm_Datan,Instruction_Codenn1,Instruction_Codenn2, RegWriten,ALU_Srcn,ALU_opn);

Forwarding_Unit FU1(Instruction_Codenn1,Instruction_Codennn,Read_Data_1n,ALU_resultn,Read_Dat_1n);
Forwarding_Unit FU2(Instruction_Codenn2,Instruction_Codennn,Read_Data_2n,ALU_resultn,Read_Dat_2n);

//Instantiate Execution Unit
Execution_Unit EX(Read_Dat_1n,Read_Dat_2n, Gen_Imm_Datan, ALU_Srcn, ALU_opn, ALU_result);

//Instantiate the EX_WB_Register_File
EX_WB_Register_File EX_WB(clk, reset, ALU_result,Instruction_Codenn1, RegWriten, ALU_resultn, Instruction_Codennn, RegWritenn);

// Instantiate Write_Back_Unit
Write_Back_Unit WB(ALU_resultn, Instruction_Codennn, Write_Data, Write_Register_Num);

endmodule