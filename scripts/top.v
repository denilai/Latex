`timescale 1ns / 1ps
module top(
	input [11:0] SW,
	output[11:0] LED
    );
	 beheviour CL1 (
	 .X(SW[3:0]),
	 .Y(LED[3:0])
	 );
	 
	 
	 mknf CL2(
	 .X(SW[7:4]),
	 .Y(LED[7:4])
	 );
	 
	 schematicdnf CL3(
	 .X(SW[11:8]),
	 .Y(LED[11:8])
	 );
endmodule
