// IF/ID REGISTER FILE
// At every positive edge of the clock output signals for next stage
//Control Signal in this part is the Jump_Detect signal

module IF_ID_Register_File(clk, reset, Instruction_Codep, Instruction_Code);

//Declare inputs to the register file
input clk;
input reset;
input [7:0]Instruction_Codep;

//Declare outputs from the register file
output [7:0] Instruction_Code;

//Declare reg
reg [7:0] Ins_Code;

//Asynchronously read Ins_Code
assign Instruction_Code = Ins_Code;

always @ (posedge clk or negedge reset)
begin
if(reset==0)
begin
	Ins_Code<=0;
end
else
begin
	if(Instruction_Codep[7]==1 && Instruction_Codep[6]==1)
	begin
		Ins_Code<=0;
	end
	else
	begin
		Ins_Code<=Instruction_Codep;
	end
end

end

endmodule