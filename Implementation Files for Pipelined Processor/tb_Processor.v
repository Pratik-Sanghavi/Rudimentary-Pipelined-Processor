// TESTBENCH FOR PROCESSOR
// Initialize the processor design
// Runs broadly across all instruction types-defined in the instruction memory

module tb_Processor();

// Declare inputs of testbench
reg clk; // clock input for processor
reg reset; // reset pin input for Instruction_Fetch unit

// Instantiate the Processor design
Processor Processor(clk, reset);

// Clock generation segment
initial
begin
	clk=1'b0;
	repeat (15)
	#3 clk =~clk;
end

// Initialize the design to all default inputs
initial
begin
reset=0; //reset is level-triggered as per our implementation and rst is negative edge triggered
#1 reset=1;
#45 ; //finish at 100 clock time - enough to run through all our 6 instructions 
end

endmodule