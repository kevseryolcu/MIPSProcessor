module mux8to1(Result, S[2:0], I0, I1, I2, I3, I4, I5, I6, I7);
	input [2:0]S;
	input I0, I1, I2, I3, I4, I5, I6, I7;
	output Result;
	wire Res4to11, Res4to12;
	
	Mux4to1 g0(Res4to11, I0, I1, I2, I3, S[1], S[0]);
	Mux4to1 g1(Res4to12, I4, I5, I6, I7, S[1], S[0]);
	
	MUX2to1 g3(Result, S[2], Res4to11, Res4to12);

endmodule 