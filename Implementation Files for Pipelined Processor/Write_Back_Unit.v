// STAGE 5: Write Back Unit
// Used to write data back into register file

module  Write_Back_Unit(Write_Datappp, Instruction_Codeppp, Write_Data, Write_Register_Num);

// Declare input signals 
input [7:0] Write_Datappp; // from EX/WB register
input [2:0] Instruction_Codeppp; //from EX/WB register 

// Declare output signal
output [7:0] Write_Data;
output [2:0] Write_Register_Num;

// assign appropriate wires to the output
assign Write_Data=Write_Datappp;
assign Write_Register_Num=Instruction_Codeppp;

endmodule