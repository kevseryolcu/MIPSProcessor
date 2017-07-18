module twoBitLeftShifter(number[31:0], twoSLNumber[31:0]);

	input [31:0] number;			//number
	output [31:0] twoSLNumber;	//left shifted number
	wire [31:0] oneSLNumber;
	
	oneBitLeftShifter g1(oneSLNumber[31:0], number[31:0]);
	
	oneBitLeftShifter g2(twoSLNumber[31:0], oneSLNumber[31:0]);

endmodule
