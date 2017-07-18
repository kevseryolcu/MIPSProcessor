module ControlUnit(RegDes, ALUSrc, MemToReg, RegWr, MemRd, MemWr, Branch, Jump, ALUOp[2:0], OpCode[5:0], Unsign, BranchNot, jal, lbu, lhu, lui, sb, sh);
	input [5:0]OpCode;
	output RegDes, ALUSrc, MemToReg, RegWr, MemRd, MemWr, Branch, Jump, Unsign, BranchNot, jal, lbu, lhu, lui, sb, sh;
	output [2:0] ALUOp;
	wire [5:0] NotOpCode;
	wire isAdd, isSub, isSlt;
	
	//Immediate Type Instructions
	wire lw, sw, beq, addi, addiu, andi, bne, ori, slti, sltiu;
	//J Type Instructions
	wire j;
	//R Trype Instructions
	wire R;
	
	
	not g0(NotOpCode[0], OpCode[0]);
	not g1(NotOpCode[1], OpCode[1]);
	not g2(NotOpCode[2], OpCode[2]);
	not g3(NotOpCode[3], OpCode[3]);
	not g4(NotOpCode[4], OpCode[4]);
	not g5(NotOpCode[5], OpCode[5]);
	
	and g6(R, NotOpCode[0], NotOpCode[1], NotOpCode[2], NotOpCode[3], NotOpCode[4], NotOpCode[5]);
	
	and g7(lw, OpCode[0], OpCode[1], NotOpCode[2], NotOpCode[3], NotOpCode[4], OpCode[5]);
	
	and g8(sw, OpCode[0], OpCode[1], NotOpCode[2], OpCode[3], NotOpCode[4], OpCode[5]);
	
	and g9(beq, NotOpCode[0], NotOpCode[1], OpCode[2], NotOpCode[3], NotOpCode[4], NotOpCode[5]);
	
	and g10(addi, NotOpCode[0], NotOpCode[1], NotOpCode[2], OpCode[3], NotOpCode[4], NotOpCode[5]);	
	
	and g11(addiu, OpCode[0], NotOpCode[1], NotOpCode[2], OpCode[3], NotOpCode[4], NotOpCode[5]);	
	
	and g12(andi, NotOpCode[0], NotOpCode[1], OpCode[2], OpCode[3], NotOpCode[4], NotOpCode[5]);	
	
	and g13(bne, OpCode[0], NotOpCode[1], OpCode[2], NotOpCode[3], NotOpCode[4], NotOpCode[5]);
	
	and g14(lbu, NotOpCode[0], NotOpCode[1], OpCode[2], NotOpCode[3], NotOpCode[4], OpCode[5]);
	
	and g15(lhu, OpCode[0], NotOpCode[1], OpCode[2], NotOpCode[3], NotOpCode[4], OpCode[5]);
	
	and g16(lui, OpCode[0], OpCode[1], OpCode[2], OpCode[3], NotOpCode[4], NotOpCode[5]);
	
	and g17(ori, OpCode[0], NotOpCode[1], OpCode[2], OpCode[3], NotOpCode[4], NotOpCode[5]);
	
	and g18(slti, NotOpCode[0], OpCode[1], NotOpCode[2], OpCode[3], NotOpCode[4], NotOpCode[5]);
	
	and g19(sltiu, OpCode[0], OpCode[1], NotOpCode[2], OpCode[3], NotOpCode[4], NotOpCode[5]);
	
	and g20(sb, NotOpCode[0], NotOpCode[1], NotOpCode[2], OpCode[3], NotOpCode[4], OpCode[5]);
	
	and g21(sh, OpCode[0], NotOpCode[1], NotOpCode[2], OpCode[3], NotOpCode[4], OpCode[5]);
	
	and g22(j, NotOpCode[0], OpCode[1], NotOpCode[2], NotOpCode[3], NotOpCode[4], NotOpCode[5]);
	
	and g23(jal, OpCode[0], OpCode[1], NotOpCode[2], NotOpCode[3], NotOpCode[4], NotOpCode[5]);

	//ALUOp
	//  000-and
	//  001-or
	//  010-nor
	//  011-add
	//  100-sub
	//  101-slt
	//  110-shift
	//  111-R-Type
	
	or g24(isAdd, lw, sw, addi, addiu, lbu, lhu, sb, sh);
	or g25(isSub, beq, bne);
	or g26(isSlt, slti, sltiu);
	
	//LUI DOSTUM NE YAPIYORSUN SEN??????????????????????????????????????????????????????????????????????????
	//sinyallerin de yanlis oluyor
	
	assign ALUOp = andi ? 3'b000: (ori ? 3'b001 : (isAdd ? 3'b011: (isSub ? 3'b100:(isSlt ? 3'b101 : 3'b111))));//(lui ? 3'b110 : 3'b111)))));
	
	//Control Signals
	//
		assign RegDes = R;														 				//regDes
	or g28(ALUSrc, lw, sw, addi, addiu, andi, ori, slti, sltiu, lbu, lhu, lui, sb, sh); 	//ALUSrc
	or g29(MemToReg, lw, lbu, lhu);											//MemToReg
	or g30(RegWr, R, lw, addi, addiu, andi,ori, slti, sltiu, lui, lbu, lhu);
	or g31(MemRd, lw, lbu, lhu);
	or g32(MemWr, sw, sb, sh);
	or g33(Branch, beq, 1'b0);
	or g34(Unsign, addiu, lbu, lhu, sltiu);	
	or g35(BranchNot, bne, 1'b0);
	assign Jump = j;


endmodule 