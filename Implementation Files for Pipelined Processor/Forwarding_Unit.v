// FORWARDING UNIT FOR DATA HAZARD CORRECTION

module Forwarding_Unit(Instruction_Codenn,Instruction_Codennn,Read_Data,ALU_result,Read_Dat);

//Declare inputs
input [2:0] Instruction_Codenn;
input [2:0] Instruction_Codennn;
input [7:0] Read_Data;
input [7:0] ALU_result;

//Declare output from unit
output [7:0] Read_Dat;

//Declare intermediate signal
wire DH_Det;

assign DH_Det = (Instruction_Codenn[2] ~^Instruction_Codennn[2]) & (Instruction_Codenn[1] ~^Instruction_Codennn[1]) & (Instruction_Codenn[0] ~^Instruction_Codennn[0]);
assign Read_Dat = DH_Det ? ALU_result : Read_Data;

endmodule