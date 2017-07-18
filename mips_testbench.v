module mips_testbench ();
	wire [31:0] Result;
	reg [5:0] opCode;
	
	
	reg [31:0] data1,data2;
	reg wEnable;
	reg clk;
	
	reg [31:0] instruction;

	integer i;	


	
	mips_core top(clk);
	initial 
		begin	
		 clk <= 1;
		 top.progC.outPC <= 32'b00000000000000000000000000000000;
		end
	initial begin
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
		#10 clk = ~clk;
	

	$finish;
	end

endmodule 