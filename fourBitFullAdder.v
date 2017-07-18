module fourBitFullAdder(result[3:0], a[3:0], b[3:0], cin, cout, prevCout);
	input [3:0]a;
	input [3:0]b;
	input cin; 
	wire [3:0] gen;
	wire [3:0] prop;
	output [3:0] result; 
	output cout, prevCout;
	wire c1, c2;

	generatePropogate k0(1'b0, b[3], a[3], gen[3], prop[3]);	
	generatePropogate k1(1'b0, b[2], a[2], gen[2], prop[2]);
	generatePropogate k2(1'b0, b[1], a[1], gen[1], prop[1]);
	generatePropogate k3(1'b0, b[0], a[0], gen[0], prop[0]);
	
	CLL4Bit k4(cin, c1, c2, prevCout, cout, gen[0], prop[0], gen[1], prop[1], gen[2], prop[2], gen[3], prop[3]);
	
	oneBitFullAdder k5(result[3], a[3], b[3], prevCout);
	oneBitFullAdder k6(result[2], a[2], b[2], c2);
	oneBitFullAdder k7(result[1], a[1], b[1], c1);
	oneBitFullAdder k8(result[0], a[0], b[0], cin);
	
endmodule 