module fullAdder16Bit(result[15:0], a[15:0], b[15:0], cin, cout, prevCout);
	
	input [15:0] a, b;
	input cin;
	output [15:0] result;
	output cout, prevCout;
	wire [3:0] Gen, Prop;
	wire c1, c2, c3, cout1, cout2, cout3, cout4, pcout1, pcout2, pcout3;

	genProp16bit g1(Prop[3:0], Gen[3:0], a[15:0], b[15:0], 1'b0);
	
	CLL4Bit g2(cin, c1, c2, c3, cout, Gen[0], Prop[0], Gen[1], Prop[1], Gen[2], Prop[2], Gen[3], Prop[3]);
	
	fourBitFullAdder g3(result[3:0], a[3:0], b[3:0], cin, cout1, pcout1);
	fourBitFullAdder g4(result[7:4], a[7:4], b[7:4], c1, cout2, pcout2);
	fourBitFullAdder g5(result[11:8], a[11:8], b[11:8], c2, cout3, pcout3);
	fourBitFullAdder g6(result[15:12], a[15:12], b[15:12], c3, cout4, prevCout);

endmodule 