module test_clk;
reg clk;
initial
	init_task;
always
	symmetric_task;

task init_task;
clk = 1'b0;
endtask

task symmetric_task;
#5 clk = ~clk;
endtask

initial
#200 $stop; // On the simulation timescale it stops beyond 200ns. So executes 2 runs of 100ns each
//#55 disable symmetric_task;
endmodule
