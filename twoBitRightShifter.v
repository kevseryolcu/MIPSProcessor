module twoBitRightShifter(number[31:0], twoSRNumber[31:0]);

	input [31:0] number;			//number
	output [31:0] twoSRNumber;	//right shifted number
	wire [31:0] oneSRNumber;
	
	oneBitRightShifter g1(oneSRNumber[31:0], number[31:0]);
	
	oneBitRightShifter g2(twoSRNumber[31:0], oneSRNumber[31:0]);

endmodule
