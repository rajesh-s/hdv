module clock_gen;
	reg clk1,clk2,clk3,clk4;
	//First case
	initial 
		clk1 = 1'b0;
	always
		#5 clk1 = ~clk1;
	//Second Case
	initial 
		clk2 = 1'b0;
        always@(clk2)
		#5 clk2 = ~clk2;
   	// Third case 
	initial
		clk3 = 1'b0;
	always@(clk3)
	#5 clk3 <= ~clk3;
	//Fourth case
	initial
		clk4 = 1'b0;
	always
	#5 clk4 <= ~clk4;
endmodule 