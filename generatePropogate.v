module generatePropogate(ALUOp2, bi, ai, gi, pi);
	input ALUOp2, bi, ai;
	output gi, pi;
	wire x;

	//for two's complement of b
	xor g1(x, bi, ALUOp2);
	
	//generate and propogate signals
	or g2(pi, ai, x);		//ai or bi
	and g3(gi, ai, x); 	//ai and bi
	
endmodule 