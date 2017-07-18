module oneBitFullAdder(result,  a, b, cin);

	input a, b, cin;
	wire d, e, f, g, h, gen, prop;
	output result;// result
	
	//calculating generate and propogate signals
	generatePropogate g1(1'b0, b, a, gen, prop);
	
	not g2(d, gen);
	and g3(e, prop, d);
	or g4(f, cin, e);
	and g5(g, cin, e);
	not g6(h, g);
	and g7(result, f, h);			//addition or subtraction result
	
endmodule 