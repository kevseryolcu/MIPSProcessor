module genProp16bit(P[3:0], G[3:0], a[15:0], b[15:0], ALUOp2);
	input [15:0] a, b;
	input ALUOp2;
	output [3:0] P, G;
	wire  [15:0] pi, gi;
	wire x, y, z, t, u, v, m, n, c, d, e, f;
	
	//////
	
	generatePropogate k0(ALUOp2, b[3], a[3], gi[3], pi[3]);	
	generatePropogate k1(ALUOp2, b[2], a[2], gi[2], pi[2]);
	generatePropogate k2(ALUOp2, b[1], a[1], gi[1], pi[1]);
	generatePropogate k3(ALUOp2, b[0], a[0], gi[0], pi[0]);


	and k4(P[0], pi[0], pi[1], pi[2], pi[3]);			//P3:0
	
	and k5(x, pi[3], gi[2]);
	and k6(y, pi[3], pi[2], gi[1]);
	and k7(z, pi[3], pi[2], pi[1], gi[0]);
	or k8(G[0], x, y, z, gi[3]);							//G3:0
	
	///////////
	
	generatePropogate l0(ALUOp2, b[7], a[7], gi[7], pi[7]);	
	generatePropogate l1(ALUOp2, b[6], a[6], gi[6], pi[6]);
	generatePropogate l2(ALUOp2, b[5], a[5], gi[5], pi[5]);
	generatePropogate l3(ALUOp2, b[4], a[4], gi[4], pi[4]);
	
	and l4(P[1], pi[4], pi[5], pi[6], pi[7]);			//P7:4
	
	and l5(t, pi[7], gi[6]);
	and l6(u, pi[7], pi[6], gi[5]);
	and l7(v, pi[7], pi[6], pi[5], gi[4]);
	or l8(G[1], t, u, v, gi[7]);							//G7:4
	
	////////
	
	generatePropogate m0(ALUOp2, b[11], a[11], gi[11], pi[11]);	
	generatePropogate m1(ALUOp2, b[10], a[10], gi[10], pi[10]);
	generatePropogate m2(ALUOp2, b[9], a[9], gi[9], pi[9]);
	generatePropogate m3(ALUOp2, b[8], a[8], gi[8], pi[8]);


	and m4(P[2], pi[8], pi[9], pi[10], pi[11]);		//P11:8
	
	and m5(m, pi[11], gi[10]);
	and m6(n, pi[11], pi[10], gi[9]);
	and m7(c, pi[11], pi[10], pi[9], gi[8]);
	or m8(G[2], m, n, c, gi[11]);							//G11:8
	
	///////
	
	generatePropogate n0(ALUOp2, b[15], a[15], gi[15], pi[15]);	
	generatePropogate n1(ALUOp2, b[14], a[14], gi[14], pi[14]);
	generatePropogate n2(ALUOp2, b[13], a[13], gi[13], pi[13]);
	generatePropogate n3(ALUOp2, b[12], a[12], gi[12], pi[12]);


	and n4(P[3], pi[12], pi[13], pi[14], pi[15]);	//P15:12
	
	and n5(d, pi[15], gi[14]);
	and n6(e, pi[15], pi[14], gi[13]);
	and n7(f, pi[15], pi[14], pi[13], gi[12]);
	or n8(G[3], d, e, f, gi[15]);							//G15:12
	
	
endmodule 

