module CLL4Bit(c0, c1, c2, c3, c4, g0, p0, g1, p1, g2, p2, g3, p3);
	input c0, g0, g1, g2, g3, p0, p1, p2, p3;
	output c1, c2, c3, c4;
	wire a, b, c, d, e, f, g, h, j, k;
	
	//c1
	and k0(a, p0, c0);
	or k1(c1, g0, a);
	
	//c2
	and k3(b, p1, g0);
	and k4(c, p1, p0, c0);
	or k5(c2, g1, b, c);
	
	//c3
	and k6(d, p2, g1);
	and k7(e, p2, p1, g0);
	and k8(f, p2, p1, p0, c0);
	or k9(c3, g2, d, e, f);
	
	//c4
	and k10(g, p3, g2);
	and k11(h, p3, p2, g1);
	and k12(j, p3, p2, p1, g0);
	and k13(k, p3, p2, p1, p0, c0);
	or k14(c4, g3, g, h, j, k);

endmodule 