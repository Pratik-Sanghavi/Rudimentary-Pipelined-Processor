//INSTRUCTION MEMORY FOR INSTRUCTION FETCH UNIT
// contains 36 byte organised data units that are referenced to by the PC 

module Instruction_Memory(
input [7:0] PC,
input reset,
output [7:0] Instruction_Code
);
reg [7:0] Mem [35:0]; 
//byte addressable memory

//For normal memory read we use the following statement
assign Instruction_Code=reset?{Mem[PC+3],Mem[PC+2],Mem[PC+1],Mem[PC+0]}:8'bzzzzzzzz;
// reads Instruction Code specified by PC in Little Endian Format

//handling reset condition
always@(reset)
begin
if(reset==0) //if reset input is equal to logic zero
// Initialize the memory with 4 instructions
	begin
	Mem[0]=8'h1B;
	// First 8-bit location with data 0x1B equivalent to instruction add r3,r3
	//Note: Little Endian Memory organization
	Mem[1]=8'h59;
	//Next 8-bit location with data 0x59 equivalent to instruction sll r3,1
	Mem[2]=8'h1B;
	//Next 8-bit location with data 0x1B equivalent to instruction add r3,r3  
	Mem[3]=8'hC5;
	//Next 8-bit location with data 0xC2 equivalent to instruction j L1
	Mem[4]=8'h5B;
	//Next 8-bit location with data 0x5B equivalent to instruction sll s3,3
	Mem[5]=8'h3B;
	//Next 8-bit location with data 0x3B equivalent to instruction add r7,r3
	Mem[6]=8'h00;
	//Next 8-bit location with data 0x00000000 equivalent to nop
	
	end	
end
endmodule