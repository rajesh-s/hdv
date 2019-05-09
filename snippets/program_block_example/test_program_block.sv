module test_program_block(input clk);
bit siga,sigb;
always@(posedge clk)
	sigb <= !siga;
endmodule
