// STAGE 1: INSTRUCTION FETCH UNIT
// This unit fetches the instruction code at the location pointed to by the program counter.
// Program counter may be incremented by 4 or jump to another location entirely depending on the output of the "PC Source MUX"
// Control signal in this segment is reset for the PC

module Instruction_Fetch(clk, reset, Instruction_Code);

// Declare the inputs
input clk;
input reset;

// Declare the outputs
output [7:0] Instruction_Code;

//Declare registered/latched pointer
reg [7:0] PC;

//Declare signal intermediates
wire [7:0] Ins_Code;

// Instantiate the Instruction memory module
Instruction_Memory I1(PC, reset, Ins_Code);

assign Instruction_Code = Ins_Code;

always @(posedge clk or negedge reset)
begin
if (reset==0)
begin
	PC <=0;
end

else
begin
if(Ins_Code[7]==1 && Ins_Code[6]==1)
begin
	PC<=PC+1;
	PC<={PC[7:6],Ins_Code[5:0]};
end
else
begin
	PC<=PC+1;
end
end
end

endmodule