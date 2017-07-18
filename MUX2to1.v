module MUX2to1(R, S, I0, I1);
	input S, I0, I1;	//sS select and I0, I1: inputs
	output R;			//R: result
	wire x, y, z;
	
	not g1(x, S);
	and g2(y, x, I0);
	and g3(z, S, I1);
	or g4(R, z, y);

endmodule 