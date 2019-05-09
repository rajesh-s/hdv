module problem_2;
// Sasken 
timeunit 1ns;
timeprecision 1ps;
parameter real t_real = 5.5;
parameter time t_time = 5ns;

initial
begin
	#t_time $display("1 %t", $realtime);
	#t_real $display("1 %t", $realtime);
	#t_time $display("1 %t", $realtime);
	#t_real $display("1 %t", $realtime);
end

initial
begin
	#t_time $display("2 %t", $time);
	#t_real $display("2 %t", $time);
	#t_time $display("2 %t", $time);
	#t_real $display("2 %t", $time);
end
endmodule
