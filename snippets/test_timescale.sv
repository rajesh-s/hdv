//`timescale 1ns/1ps// Default_time_unit for unspecified unit delays Eg. #1/Time_precision
timeunit 1ns;
timeprecision 1ps;

module test_timescale;
int a,b;
initial
begin
	//#1ns $display("Time now:  %t",$time);
	//#1us $display("Time now:  %t",$time);
	//#1ns $display("Time now:  %t",$time);
	//#1s $display("Time now:  %t",$time);
	$monitor($realtime,"a = %b b= %b",a,b);	
	a = 0; b = 0;
	#10.12 {a,b} = 2'b01;
	#10.45 {a,b} = 2'b10;
	

end
endmodule
