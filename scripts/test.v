`timescale 1ns / 1ps

module test;

	// Inputs
	reg [11:0] SW;

	// Outputs
	wire [11:0] LED;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.SW(SW), 
		.LED(LED)
	);

	initial begin
		// Initialize Inputs
		SW = 12'h000;
		#10
		SW = 12'h111;
		#10
		SW = 12'h222;
		#10
		SW = 12'h333;
		#10
		SW = 12'h444;
		#10
		SW = 12'h555;
		#10
		SW = 12'h666;
		#10
		SW = 12'h777;
		#10
		SW = 12'h888;
		#10
		SW = 12'h999;
		#10
		SW = 12'haaa;
		#10
		SW = 12'hbbb;
		#10
		SW = 12'hccc;
		#10
		SW = 12'hddd;
		#10
		SW = 12'heee;
		#10
		SW = 12'hfff;
		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

