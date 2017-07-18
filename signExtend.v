module signExtend(number[15:0], seNumber[31:0]);
	input [15:0]number;
	output [31:0]seNumber;
	
	
	and g1(seNumber[31], 1'b1, number[15]);
	and g2(seNumber[30], 1'b1, number[15]);
	and g3(seNumber[29], 1'b1, number[15]);
	and g4(seNumber[28], 1'b1, number[15]);
	and g5(seNumber[27], 1'b1, number[15]);
	and g6(seNumber[26], 1'b1, number[15]);
	and g7(seNumber[25], 1'b1, number[15]);
	and g8(seNumber[24], 1'b1, number[15]);
	and g9(seNumber[23], 1'b1, number[15]);
	and g10(seNumber[22], 1'b1, number[15]);
	and g11(seNumber[21], 1'b1, number[15]);
	and g12(seNumber[20], 1'b1, number[15]);
	and g13(seNumber[19], 1'b1, number[15]);
	and g14(seNumber[18], 1'b1, number[15]);
	and g15(seNumber[17], 1'b1, number[15]);
	and g16(seNumber[16], 1'b1, number[15]);
	
	and g17(seNumber[15], 1'b1, number[15]);
	and g18(seNumber[14], 1'b1, number[14]);
	and g19(seNumber[13], 1'b1, number[13]);
	and g20(seNumber[12], 1'b1, number[12]);
	and g21(seNumber[11], 1'b1, number[11]);
	and g22(seNumber[10], 1'b1, number[10]);
	and g23(seNumber[9], 1'b1, number[9]);
	and g24(seNumber[8], 1'b1, number[8]);
	and g25(seNumber[7], 1'b1, number[7]);
	and g26(seNumber[6], 1'b1, number[6]);
	and g27(seNumber[5], 1'b1, number[5]);
	and g28(seNumber[4], 1'b1, number[4]);
	and g29(seNumber[3], 1'b1, number[3]);
	and g30(seNumber[2], 1'b1, number[2]);
	and g31(seNumber[1], 1'b1, number[1]);
	and g32(seNumber[0], 1'b1, number[0]);




endmodule 