module mips_core_test;
	wire [31:0] Result;
	reg [5:0] opCode;
	
	
	reg [31:0] data1,data2;
	reg wEnable;
	reg clk;
	
	reg [31:0] instruction;

	integer i;	

/*
initial 
	begin
		$readmemh("C:/Users/KEVSER/Desktop/project03/registers.txt", top.mem.data);
	end
initial
	begin
		$readmemh("C:/Users/KEVSER/Desktop/project03/datamem.txt", top.ram.mem);
	end


initial
	begin
		$readmemb("C:/Users/KEVSER/Desktop/project03/instructions.txt",top.inst.mem); 
end 
*/
	
mips_core top(clk);
initial 
	begin	
	 /*top.inst.mem[0] = 32'b10101100000001010000000000000001;//sw
	 top.inst.mem[1] = 32'b10001100000001110000000000000001;//lw
	 top.inst.mem[2] = 32'b00100000011001000001000001100000;//addi
	 top.inst.mem[3] = 32'b00100100101001000001000001100000;//addiu
	 top.inst.mem[4] = 32'b00010000011000110000000000000010;//beq
	 top.inst.mem[5] = 32'b00110000101001000001000001100000;//andi atlanacak
	 top.inst.mem[6] = 32'b00110100101001000001000001100000;//ori atlanacak
	 top.inst.mem[7] = 32'b00010100011000110001000001100000;//bne
	 top.inst.mem[8] = 32'b00110000101001000001000001100000;//andi
	 top.inst.mem[9] = 32'b00110100101001000001000001100000;//ori
	 top.inst.mem[10] = 32'b00101100011001001001000001100000;//sltiu
	 top.inst.mem[11] = 32'b00101000011001001001000001100000;//slti
	 top.inst.mem[12] = 32'b00111100011001000001000001100000;//lui*/
	/*
	 for(i= 0 ; i < 40 ; i = i+1)
		begin
		#20
		 clk = 0;
		#20
		 clk = 1;
		end
	 
	 */
	 
	 clk <= 1;
	 top.progC.outPC <= 32'b00000000000000000000000000000000;
	 
	 //  clock u degistirerek pc registerden yeni adres cikmasini sagladik*/
	
	// $monitor("reg mem = %b\n",top.mem.registers);
	 //$monitor("data mem = %b\n",top.mem.data);
	 //$finish;
	end

	 always begin
	 
		#10 clk = ~clk;
	 end




endmodule 