module ALU32Bit(a[31:0], b[31:0], Result[31:0], zero, ALUCtrl[3:0]);
	input [31:0]a, b;
	input [3:0]ALUCtrl;
	output [31:0]Result;
	output zero;
	wire V, set, cout, prevCout;
	wire [31:0]ALUCtrlXorB, addResult, andResult, orResult, norResult, sllResult, srlResult, sltResult;
	wire [2:0]selection;

	//b xor ALUCtrl[3] for inverted b
	xor32Bit BxorALUCtrlMSB(ALUCtrl[3], b, ALUCtrlXorB);
	
	//and
	and32Bit aANDb(a, ALUCtrlXorB, andResult);
	
	//or
	or32Bit aORb(a, ALUCtrlXorB, orResult);
	
	//nor 
	nor32Bit aNORb(a, ALUCtrlXorB, norResult);
	
	//shift left one bit
	oneBitLeftShifter shiftLeft(sllResult, b);
	
	//shift right one bit
	oneBitRightShifter shiftRight(srlResult, b);
	
	//addition or substruction
	Adder32Bit addition(addResult, a, ALUCtrlXorB, 1'b0, cout, prevCout);
	
	//for set on less than
	xor g0(V, prevCout, cout);
	xor g1(set, V, addResult[31]); 	
	
	assign sltResult[0] = 1'b0;
	assign sltResult[1] = 1'b0;
	assign sltResult[2] = 1'b0;
	assign sltResult[3] = 1'b0;
	assign sltResult[4] = 1'b0;
	assign sltResult[5] = 1'b0;
	assign sltResult[6] = 1'b0;
	assign sltResult[7] = 1'b0;
	assign sltResult[8] = 1'b0;
	assign sltResult[9] = 1'b0;
	assign sltResult[10] = 1'b0;
	assign sltResult[11] = 1'b0;
	assign sltResult[12] = 1'b0;
	assign sltResult[13] = 1'b0;
	assign sltResult[14] = 1'b0;
	assign sltResult[15] = 1'b0;
	assign sltResult[16] = 1'b0;
	assign sltResult[17] = 1'b0;
	assign sltResult[18] = 1'b0;
	assign sltResult[19] = 1'b0;
	assign sltResult[20] = 1'b0;
	assign sltResult[21] = 1'b0;
	assign sltResult[22] = 1'b0;
	assign sltResult[23] = 1'b0;
	assign sltResult[24] = 1'b0;
	assign sltResult[25] = 1'b0;
	assign sltResult[26] = 1'b0;
	assign sltResult[27] = 1'b0;
	assign sltResult[28] = 1'b0;
	assign sltResult[29] = 1'b0;
	assign sltResult[30] = 1'b0;
	assign sltResult[31] = set;	
	
	assign selection = {ALUCtrl[2:0]};
	
	//ALU result selection
	mux8to1for32Bit hey(selection, andResult, orResult, addResult, sltResult, norResult, sllResult, andResult, srlResult, Result);
	
	//if all result is zero
	nor ZeroResult(zero, Result[0], Result[1], Result[2], Result[3], Result[4], Result[5], Result[6], Result[7], Result[8], Result[9], 
						Result[10], Result[11], Result[12], Result[13], Result[14], Result[15], Result[16], Result[17], Result[18], Result[19], 
						Result[20], Result[21], Result[11], Result[23], Result[24], Result[25], Result[26], Result[27], Result[28], Result[29], 
						Result[30], Result[31]);

endmodule 

