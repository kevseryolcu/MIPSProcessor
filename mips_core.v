module mips_core(clock);
	input clock;
	wire[31:0] instruction, signExResI, signExResJ, shiftLeftRes, ALURes, readData1, readData2, 
					dataMemRes, writeData, ALUinp2, nextPC, presentPC, temp1, temp2, temp3, temp5, temp6;
	wire RegDes, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, Jump, temp4, signal, unsign, BranchNot, jal, lbu, lhu, lui, sb, sh, temp7, temp8;
	wire x1,x2, x3, x4, x5, x6, x7, x8, x9;
	wire[2:0] ALUOp;
	wire [5:0] OpCode, FuncField;
	wire [4:0] rsAddr, rtAddr, rdAddr, shamt, writeReg, writeReg2;
	wire [16:0] immediate;
	wire [3:0] ALUCtrl;
	wire zero;
	wire [25:0] jtype;
	reg [31:0] registers [0:31];
	
	
	//instructionu parcalara ayirir
	assign {OpCode} = {instruction[31:26]};
	assign {jtype} = {instruction[25:0]};
	assign {rsAddr} = {instruction[25:21]};
	assign {rtAddr} = {instruction[20:16]};
	assign {immediate} = {instruction[15:0]};
	assign {rdAddr} = {instruction[15:11]};
	assign {shamt} = {instruction[10:6]};
	assign {FuncField} = {instruction[5:0]};
	
	//control sinyallerini üret opcode a göre
	ControlUnit cu(RegDes, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp, OpCode, unsign, BranchNot, jal, lbu, lhu, lui, sb, sh);
	
	assign signal = unsign ? 1'b0 : immediate[15];
	
	//gerekli sayilari extend eder
	assign signExResI = { {16{signal}}, immediate[15:0]};//extend ettik
	assign signExResJ = { {6{jtype[25]}}, jtype[25:0]}; // jump adresini extend ettik
	
	
	
	//ALU control sinyallerini üretir opcode ve funcField a göre
	ALUControl ac(ALUCtrl, ALUOp, FuncField);
	
	//yazilacak registeri secer
	assign writeReg = RegDes ? rdAddr : rtAddr;
	
	//register contentlerini okur
	//mips_registers hey(readData1, readData2, writeData,	rsAddr, rtAddr, writeReg, RegWrite, clock);
	
	//sign extend immediate ile rt nin contenti arasinda secim yapar
	assign ALUinp2 = ALUSrc ? signExResI : readData2;
	
	//gerekli islemleri yapar
	ALU32Bit a32(readData1, ALUinp2, ALURes, zero, ALUCtrl);
	
	assign x1 = sb ? {readData2[7:0]} : (sh ? {readData2[15:0]} : readData2);
	
	assign x2 =  sb ? {ALURes[7:0]} : (sh ? {ALURes[15:0]} : ALURes);
	
	//gerekli memory okuma yazmasini yapar
	mips_data_mem mdm(dataMemRes, x2, x1, MemRead, MemWrite);
	
	
	
	//registera yazilacak datayi secer
	assign writeData = MemToReg ? dataMemRes : 
							(jal ? presentPC + 2 :
							(lbu ? {{24{1'b0}}, dataMemRes[7:0]} : 
							(lhu ? {{16{1'b0}}, dataMemRes[15:0]} :
							(lui ? {signExResI[15:0],{16{1'b0}}} :ALURes) )));
	
	assign writeReg2 = jal ? 5'b11111 : writeReg;
	
	//registera yazar
	mips_registers mrwrite(readData1, readData2, writeData,	rsAddr, rtAddr, writeReg2, RegWrite, clock);
	
	//sign extend immediate sayiyi 2 bit sola shift eder
	twoBitLeftShifter tbls(signExResI, shiftLeftRes);

	//PC nin arttirilmasi
	assign temp1 = presentPC + 1;
	assign temp2 = temp1 + shiftLeftRes;//for beq
	assign temp3 = temp1 + signExResJ;	//for jump
	
	assign temp7 = Branch ? zero :(BranchNot ? ~zero : zero);
	assign temp8 = Branch ? Branch :(BranchNot ? BranchNot : 1'b0);
	
	
	and g(temp4, temp8, temp7);
	
	assign nextPC = temp4 ? (Jump ? temp3 : temp2) : temp1;
	
	//PC
	PC progC(clock , nextPC, presentPC);
	
	//program counterdaki adresi okur
	mips_instr_mem inst(instruction, presentPC);
	
	initial
		$monitor("PC = %b\ninstruction = %b\n %b %b %b %b %b %b %b %b %b %b\n", presentPC, instruction, RegDes, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp, OpCode);
	

endmodule 