// ID/EX REGISTER FILE
// At every positive edge of the clock output signals for next stage
//Stores control signals for the next stages alongwith RegWrite

module ID_EX_Register_File(clk, reset, Read_Data_1pp,Read_Data_2pp,Gen_Imm_Datapp, Instruction_Codepp1,Instruction_Codepp2, RegWritepp, ALU_Srcpp, ALU_oppp, Read_Data_1,Read_Data_2,Gen_Imm_Data,Instruction_Code1,Instruction_Code2, RegWrite,ALU_Src,ALU_op);

//Declare inputs to the Unit
input clk;
input reset;
input [7:0] Read_Data_1pp;
input [7:0] Read_Data_2pp;
input [7:0] Gen_Imm_Datapp;
input [2:0] Instruction_Codepp1;
input [2:0] Instruction_Codepp2;
input RegWritepp;
input ALU_Srcpp;
input ALU_oppp;

//Declare Outputs
output [7:0] Read_Data_1;
output [7:0] Read_Data_2;
output [7:0] Gen_Imm_Data;
output [2:0] Instruction_Code1;
output [2:0] Instruction_Code2;
output RegWrite;
output ALU_Src;
output ALU_op;

//Declare latched signals
reg [7:0] R_Data_1;
reg [7:0] R_Data_2;
reg [7:0] Gen_Imm_Dat;
reg [2:0] Ins_Code1;
reg [2:0] Ins_Code2;
reg RW;
reg ALU_S;
reg ALU_o;

//Asynchronously read registers
assign Read_Data_1 = R_Data_1;
assign Read_Data_2 = R_Data_2;
assign Gen_Imm_Data = Gen_Imm_Dat;
assign Instruction_Code1 = Ins_Code1;
assign Instruction_Code2 = Ins_Code2;
assign RegWrite = RW;
assign ALU_Src = ALU_S;
assign ALU_op = ALU_o;

always @ (posedge clk or negedge reset)
begin
if(reset==0)
begin
	R_Data_1<=0;
	R_Data_2<=0;
	Gen_Imm_Dat<=0;
	Ins_Code1<=3'bzzz;
	Ins_Code2<=3'bzzz;
	RW<=0;
	ALU_S<=0;
	ALU_o<=0;
end
else
begin
	R_Data_1<=Read_Data_1pp;
	R_Data_2<=Read_Data_2pp;
	Gen_Imm_Dat<=Gen_Imm_Datapp;
	Ins_Code1<=Instruction_Codepp1;
	Ins_Code2<=Instruction_Codepp2;
	RW<=RegWritepp;
	ALU_S<=ALU_Srcpp;
	ALU_o<=ALU_oppp;
end
end

endmodule