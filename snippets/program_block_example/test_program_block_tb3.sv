module test_program_block_tb3;
bit clk;
test_program_block dut3(clk);
test_program_block_tb2 bi(clk);
initial
begin
for(int i = 0; i<= 16; i++)
	#1 clk = ~clk;
end
always@(negedge clk)// VALUES FROM REACTIVE REGION
$strobe("%d \t %b \t %b \t",$time,dut3.siga, dut3.sigb);// POSTPONE REGION at the very end
endmodule
// GIVES PRIORITY TO THE 