module ALUControl(ALUCtrl[3:0], ALUOp[2:0], FuncField[5:0]);
	input [2:0]ALUOp;
	input [5:0]FuncField;
	output [3:0]ALUCtrl;
	wire andOp, orOp, addOp, subOp, sltOp, norOp, sllOp;//, srlOp;
	wire [2:0]notALUOp;
	wire [5:0]notFuncField;
	wire [17:0]temp;
	
	not k0(notALUOp[0], ALUOp[0]);
	not k1(notALUOp[1], ALUOp[1]);
	not k2(notALUOp[2], ALUOp[2]);
	not k3(notFuncField[0], FuncField[0]);
	not k4(notFuncField[1], FuncField[1]);
	not k5(notFuncField[2], FuncField[2]);
	not k6(notFuncField[3], FuncField[3]);
	not k7(notFuncField[4], FuncField[4]);
	not k8(notFuncField[5], FuncField[5]);
	
	//if operation is and
	and g2(temp[0], notALUOp[0], notALUOp[1], notALUOp[2]);
	and g3(temp[1], notFuncField[0], FuncField[2], FuncField[5], ALUOp[0], ALUOp[1], ALUOp[2]);
	or g4(andOp, temp[0], temp[1]);
	
	//if operation is  or
	and g23(temp[2], ALUOp[0], notALUOp[1], notALUOp[2]);
	and g24(temp[3], FuncField[0], notFuncField[1], FuncField[2], ALUOp[0], ALUOp[1], ALUOp[2]);
	or g25(orOp , temp[2], temp[3]);
	
	//if operation is  add
	and g5(temp[4], ALUOp[0], ALUOp[1], notALUOp[2]);
	and g6(temp[5], notFuncField[1], notFuncField[2], notFuncField[3], FuncField[5], ALUOp[0], ALUOp[1], ALUOp[2]);
	or g7(addOp, temp[4], temp[5]);
	
	//if operation is  sub
	and g8(temp[6], notALUOp[0], notALUOp[1], ALUOp[2]);
	and g9(temp[7], FuncField[1], notFuncField[2], notFuncField[3], FuncField[5], ALUOp[0], ALUOp[1], ALUOp[2]);
	or g10(subOp, temp[6], temp[7]);
	
	//if operation is  slt
	and g11(temp[8], ALUOp[0], notALUOp[1], ALUOp[2]);
	and g12(temp[9], FuncField[1],  FuncField[3], ALUOp[0], ALUOp[1], ALUOp[2]);
	or g13(sltOp, temp[8], temp[9]);
	
	//if operation is  nor
	and g14(temp[10], notALUOp[0], ALUOp[1], notALUOp[2]);
	and g15(temp[11], FuncField[0], FuncField[1], FuncField[2], ALUOp[0], ALUOp[1], ALUOp[2]);
	or g16(norOp, temp[10], temp[11]);
	
	//if operation is  sll
	//and g17(temp[12], ALUOp[0], ALUOp[1], ALUOp[2]);//if R-Type
	and g18(temp[13], notFuncField[1], notFuncField[3], notFuncField[5], ALUOp[0], ALUOp[1], ALUOp[2]);
	//or g19(sllOp, temp[12], temp[13]);
	assign sllOp = temp[13];
	
	//if operation is srl
	//and g20(temp[14], ALUOp[0], ALUOp[1], ALUOp[2]);//if R-Type
	//and g21(temp[15], notFuncField[1], notFuncField[3], FuncField[5], ALUOp[0], ALUOp[1], ALUOp[2]);
	//or g22(srlOp, temp[14], temp[15]);
//assign srlOp = temp[15];

	assign ALUCtrl = andOp ? 4'b0000 : 
							 (orOp ? 4'b0001 :
							 (addOp ? 4'b0010 :
							 (subOp ? 4'b1010 : 
							 (sltOp ? 4'b1011 :
							 (norOp ? 4'b0100 :
							 (sllOp ? 4'b0101:
							  4'b0111))))));
	
endmodule 