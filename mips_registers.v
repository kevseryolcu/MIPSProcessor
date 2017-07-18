module mips_registers
(
	output reg [31:0] read_data_1, read_data_2,
	input [31:0] write_data,
	input [4:0] read_reg_1, read_reg_2, write_reg,
	input signal_reg_write, clk
);
	reg [31:0] registers [0:31];
	
	initial begin
		$readmemb("C:/Users/KEVSER/Desktop/project03/registers.mem", registers);
	end

	always @ (posedge clk)
	begin
		/*if (signal_reg_write) begin
			registers[write_reg] <= write_data;
		end
		else begin*/
			$display("reg[i1]: %b, reg[i2]: %b\n", registers[read_reg_1], registers[read_reg_2]);
			read_data_1 = registers[read_reg_1];
			read_data_2 = registers[read_reg_2];
			$display("readdata1: %b, readdata2: %b\n", read_data_1, read_data_2);
	
		//end
	end
	always @ (negedge clk)
	begin
		if (signal_reg_write) begin
			registers[write_reg] = write_data; //3ünü de bastir
			$display("write_data: %b, writereg: %b\n", write_data, write_reg);
		end
	end
	initial 
		$writememb("C:/Users/KEVSER/Desktop/project03/reg.txt",registers);
	
endmodule
