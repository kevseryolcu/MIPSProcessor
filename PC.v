module PC(clk, address , outPC);
	reg [31:0] pc;
	input [31:0] address;
	input clk;
	output reg [31:0] outPC;
	
	
	always @(address)
		begin
			pc = address;
		end
	
	always @(negedge clk)
		begin
			outPC = pc ;
			$display("PC = %b", outPC);
		end
endmodule 