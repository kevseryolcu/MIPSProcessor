module oneBitLeftShifter(result[31:0], number[31:0]);
	input [31:0] number;
	output [31:0] result;
	
	
		//one bit left shifter
	//				Result	  Select		I0			I1
	
	MUX2to1 g1(result[0], 1'b0, 1'b0, number[0]);
	MUX2to1 g2(result[1], 1'b0, number[0], number[1]);
	MUX2to1 g3(result[2], 1'b0, number[1], number[2]);
	MUX2to1 g4(result[3], 1'b0, number[2], number[3]);
	MUX2to1 g5(result[4], 1'b0, number[3], number[4]);
	MUX2to1 g6(result[5], 1'b0, number[4], number[5]);
	MUX2to1 g7(result[6], 1'b0, number[5], number[6]);
	MUX2to1 g8(result[7], 1'b0, number[6], number[7]);
	MUX2to1 g9(result[8], 1'b0, number[7], number[8]);
	MUX2to1 g10(result[9], 1'b0, number[8], number[9]);
	MUX2to1 g11(result[10], 1'b0, number[9], number[10]);
	MUX2to1 g12(result[11], 1'b0, number[10], number[11]);
	MUX2to1 g13(result[12], 1'b0, number[11], number[12]);
	MUX2to1 g14(result[13], 1'b0, number[12], number[13]);
	MUX2to1 g15(result[14], 1'b0, number[13], number[14]);
	MUX2to1 g16(result[15], 1'b0, number[14], number[15]);
	MUX2to1 g17(result[16], 1'b0, number[15], number[16]);
	MUX2to1 g18(result[17], 1'b0, number[16], number[17]);
	MUX2to1 g19(result[18], 1'b0, number[17], number[18]);
	MUX2to1 g20(result[19], 1'b0, number[18], number[19]);
	MUX2to1 g21(result[20], 1'b0, number[19], number[20]);
	MUX2to1 g22(result[21], 1'b0, number[20], number[21]);
	MUX2to1 g23(result[22], 1'b0, number[21], number[22]);
	MUX2to1 g24(result[23], 1'b0, number[22], number[23]);
	MUX2to1 g25(result[24], 1'b0, number[23], number[24]);
	MUX2to1 g26(result[25], 1'b0, number[24], number[25]);
	MUX2to1 g27(result[26], 1'b0, number[25], number[26]);
	MUX2to1 g28(result[27], 1'b0, number[26], number[27]);
	MUX2to1 g29(result[28], 1'b0, number[27], number[28]);
	MUX2to1 g30(result[29], 1'b0, number[28], number[29]);
	MUX2to1 g31(result[30], 1'b0, number[29], number[30]);
	MUX2to1 g32(result[31], 1'b0, number[30], number[31]);
	
	
endmodule 