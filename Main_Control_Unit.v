// MAIN CONTROL UNIT
// Generates all the control signals for all the stages
// Uses Instruction_Code of of the current instruction to compute the control signals
 
module Main_Control_Unit(Instruction_Code, RegWrite, ALU_Src, ALU_op);

// Declare inputs to Main_Control_Unit
input [7:0] Instruction_Code;

// Declare outputs from the Main_Control_Unit
output RegWrite;
output ALU_Src;
output ALU_op;

//Generate Regwrite signal
assign RegWrite=~(Instruction_Code[7]); //Only write for sll or add instructions

// Generate ALU_Src signal
assign ALU_Src = Instruction_Code[6];

// Generate ALU_op signal
assign ALU_op = Instruction_Code[6];

endmodule