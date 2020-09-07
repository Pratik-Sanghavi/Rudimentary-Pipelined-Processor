// REGISTER FILE FOR INSTRUCTION DECODE UNIT
// contains 8, 8 bit registers that can be read 2 at a time asynchronously and written at positive clock edge

module Register_file(
input [2:0] Read_Reg_Num_1,
input [2:0] Read_Reg_Num_2,
input [2:0] Write_Reg_Num,
input [7:0]Write_Data,
input RegWrite,
input clk,
input reset,
output [7:0] Read_Data_1,
output [7:0] Read_Data_2
);

//8 8-bit Registers
reg [7:0] Reg [0:7];

//Asynchronously read data 
assign Read_Data_1=Reg[Read_Reg_Num_1]; //Read data present a register location referenced to by Read_Reg_Num_1 into Read_Data_1

assign Read_Data_2=Reg[Read_Reg_Num_2]; //Read data present a register location referenced to by Read_Reg_Num_2 into Read_Data_2

always @ (*)
begin
//Write numbers into registers on reset(active low). Here reset is given to be an asynchronous input.
if(reset==0)
begin
	Reg[0]=0; Reg[1]=1; Reg[2]=2; Reg[3]=3; Reg[4]=4;
	Reg[5]=5; Reg[6]=6; Reg[7]=7;
end
//Write data into registers depending on state of RegWrite at positive edge of clock
if(RegWrite==1)
begin
	Reg[Write_Reg_Num] <= Write_Data;  //Reg referenced to by Write Reg_Num is conferred the value carried by Write_Data
end

end

endmodule