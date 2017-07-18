module Adder32Bit(result[31:0], a[31:0], b[31:0], cin, cout, PrevCout);

	input [31:0]a, b;					//numbers that is added
	input cin;							//carry in
	output [31:0]result; 			//addition result
	output cout, PrevCout;			//carry out after addition 32 bit numbers
											//previuous cout is for set less than operation
											//prevCout is last carry in of addition
	wire carry16, tempPCout;		//carry after addition less significant 16 bit

	fullAdder16Bit g1(result[15:0],  a[15:0],  b[15:0],  cin,  carry16, tempPCout);
	fullAdder16Bit g2(result[31:16], a[31:16], b[31:16], carry16, cout, PrevCout);
	
endmodule
