module xor32Bit(ALUCtrlMSB, b[31:0], result[31:0]);
	input [31:0] b;
	input ALUCtrlMSB;
	output [31:0]result;
	
	xor g0(result[0], ALUCtrlMSB, b[0]);
	xor g1(result[1], ALUCtrlMSB, b[1]);
	xor g2(result[2], ALUCtrlMSB, b[2]);
	xor g3(result[3], ALUCtrlMSB, b[3]);
	xor g4(result[4], ALUCtrlMSB, b[4]);
	xor g5(result[5], ALUCtrlMSB, b[5]);
	xor g6(result[6], ALUCtrlMSB, b[6]);
	xor g7(result[7], ALUCtrlMSB, b[7]);
	xor g8(result[8], ALUCtrlMSB, b[8]);
	xor g9(result[9], ALUCtrlMSB, b[9]);
	xor g10(result[10], ALUCtrlMSB, b[10]);
	xor g11(result[11], ALUCtrlMSB, b[11]);
	xor g12(result[12], ALUCtrlMSB, b[12]);
	xor g13(result[13], ALUCtrlMSB, b[13]);
	xor g14(result[14], ALUCtrlMSB, b[14]);
	xor g15(result[15], ALUCtrlMSB, b[15]);
	xor g16(result[16], ALUCtrlMSB, b[16]);
	xor g17(result[17], ALUCtrlMSB, b[17]);
	xor g18(result[18], ALUCtrlMSB, b[18]);
	xor g19(result[19], ALUCtrlMSB, b[19]);
	xor g20(result[20], ALUCtrlMSB, b[20]);
	xor g21(result[21], ALUCtrlMSB, b[21]);
	xor g22(result[22], ALUCtrlMSB, b[22]);
	xor g23(result[23], ALUCtrlMSB, b[23]);
	xor g24(result[24], ALUCtrlMSB, b[24]);
	xor g25(result[25], ALUCtrlMSB, b[25]);
	xor g26(result[26], ALUCtrlMSB, b[26]);
	xor g27(result[27], ALUCtrlMSB, b[27]);
	xor g28(result[28], ALUCtrlMSB, b[28]);
	xor g29(result[29], ALUCtrlMSB, b[29]);
	xor g30(result[30], ALUCtrlMSB, b[30]);
	xor g31(result[31], ALUCtrlMSB, b[31]);



endmodule 