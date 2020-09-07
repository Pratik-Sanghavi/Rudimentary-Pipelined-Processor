// ID/EX REGISTER FILE
// At every positive edge of the clock output signals for next stage

module EX_WB_Register_File(clk, reset, ALU_resultppp,Instruction_Codeppp, RegWriteppp, Write_Data, Instruction_Code, RegWrite);

//Declare inputs to the Unit
input clk;
input reset;
input [7:0] ALU_resultppp;
input [2:0] Instruction_Codeppp;
input RegWriteppp;

//Declare Outputs
output [7:0] Write_Data;
output [2:0] Instruction_Code;
output RegWrite;

// Declare latched intermediates
reg [7:0] Write_Dat;
reg [2:0] Ins_Code;
reg RW;

//Asynchronously read registers
assign Write_Data = Write_Dat;
assign Instruction_Code = Ins_Code;
assign RegWrite = RW;

always@(posedge clk or negedge reset)
begin
if(reset==0)
begin
	Write_Dat<=0;
	Ins_Code<=3'bzzz;
	RW<=0;
end
else
begin
	Write_Dat<=ALU_resultppp;
	Ins_Code<=Instruction_Codeppp;
	RW<=RegWriteppp;
end
end

endmodule