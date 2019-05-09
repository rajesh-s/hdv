module test_program_block_tb;
bit clk;
test_program_block dut(clk);
initial
begin
for(int i = 0; i<= 16; i++)
	#1 clk = ~clk;
end
always@(posedge clk)
	dut.siga <= dut.sigb; // Race condition between DUT and TB is resolved using a program block
always@(negedge clk)
	$display("Time = %2d\t siga = %0b sigb = %0b",$time,dut.siga,dut.sigb);
endmodule
