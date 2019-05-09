program test_crosscoverage;
bit clk;
bit [1:0] bit1,bit2;
covergroup cg1 @(posedge clk);
	bit1: coverpoint bit1;
	bit2: coverpoint bit2;
	bit1xbit2:cross bit1,bit2;
endgroup
cg1 cg1_1 = new;
initial
begin
	clk = 0;
	repeat(20)
	begin
		bit1=$random();
		bit2=$random();
		#5 clk = ~clk;
		#5 clk = ~clk;
	end
end
initial
$monitor($time," at :Bit 1= %0b  , Bit 2 = %0b ",bit1,bit2);
endprogram 