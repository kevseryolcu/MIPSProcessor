module Mux4to1(Res, I0, I1, I2, I3, S1, S0);

	input I0, I1, I2, I3,  S1, S0;
	output Res;
	wire a, b, c, d, e, f;
	
	//4:1 MUX implementation
	not g0(a, S1);
	not g1(b, S0);
	
	and g2(c, a, b, I0);		//if operation is and
	and g3(d, a, S0, I1);	//if operation is or
	and g4(e, b, S1, I2);	//if operation is add , sub
	and g5(f, S0, S1, I3);	//if operation is set on less than
	
	or g6(Res, c, d, e, f);	//result
	
endmodule 