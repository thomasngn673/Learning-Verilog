`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:24:10 01/06/2021
// Design Name:   threeInputOrGate
// Module Name:   C:/Users/Thomas Nguyen/Desktop/Verilog/test_simulation/stimulus.v
// Project Name:  test_simulation
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: threeInputOrGate
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stimulus;

	// Inputs
	reg i1;
	reg i2;
	reg i3;

	// Outputs
	wire gateOutput;

	// Instantiate the Unit Under Test (UUT)
	threeInputOrGate uut (
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.gateOutput(gateOutput)
	);

	initial begin
		// Initialize Inputs
		i1 = 0;
		i2 = 0;
		i3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#50 i1=1; // after 50 ns, change input1 to 1
		#50 i1=0; // after 50 ns, change input1 to 0
		#60 i3=1; // after 60 ns, change input3 to 1
	end
	
	initial begin
		$monitor("output=%d, il=%d, i2=%d, i3=%d\n", gateOutput, i1, i2, i3);
	end
      
endmodule

