module CLA16bit(r[15:0], ALUOp[2:0], a[15:0], b[15:0], cin, lessi, cout, G[3:0], P[3:0]);
	input [2:0] ALUOp;
	input [15:0] a, b;
	input cin, lessi;
	output [15:0]r;
	output [3:0]G, P;
	output cout;
	wire c1, c2, c3, cout1, cout2, cout3, cout4;

	genProp16bit g1(P[3:0], G[3:0], a[15:0], b[15:0], ALUOp[2]);
	CLL4Bit g2(cin, c1, c2, c3, cout, G[0], P[0], G[1], P[1], G[2], P[2], G[3], P[3]);

	CLA4Bit g3(r[3:0], ALUOp[2:0], a[3:0], b[3:0], cin, lessi, cout1);
	CLA4Bit g4(r[7:4], ALUOp[2:0], a[7:4], b[7:4], c1, lessi, cout2);
	CLA4Bit g5(r[11:8], ALUOp[2:0], a[11:8], b[11:8], c2, lessi, cout3);
	CLA4Bit g6(r[15:12], ALUOp[2:0], a[15:12], b[15:12], c3, lessi, cout4);
	
endmodule 