//ALU DESIGN FOR THE EXECUTION UNIT
// acts on 2 32 bit inputs and controlled by ALU_operation signal
// can perform 'ADD' and 'SLL' operations

module ALU_design(A,B,cline,res);
	input signed[7:0] A,B;
	input cline;
	output reg[7:0] res;	
	always@(*)
	begin
		case(cline)
		1'b0: res=A + B; //(bitwise ADD)
		1'b1: res=A << B; //(sll by value in B)
		endcase
	end
endmodule