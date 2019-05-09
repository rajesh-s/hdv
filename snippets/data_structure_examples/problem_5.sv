/*Define 3 tasks t1,t2,t3. Task t1 is taking 10ms, t2 is taking 5ms to execute.
 Each task containing one display statement. Task t1 and t2 are inside fork join
Three differnet execution steps in the following order i. t1,t3,t2  ii. t3,t1,t2   iii. t1,t2,t3 */

`timescale 1ns/1ps
module problem_5;

task t1;
 $display($time,"  : First task");
endtask

task t2;
 $display($time,"  : Second task");
endtask

task t3;
 $display($time,"  : Third task");
endtask

// First method. T1 first Then T3 then T2
initial
begin
fork
	#1000000 t1;
	#2000000 t2;
join_any
#500000 t3;
end

/*// Second method. T3 first. then T1 then t2
initial
begin
fork
	#1000000 t1;
	#2000000 t2;
join_none
#500000 t3;
end
*/

// Third method. T1 first. then t2 then t3
/*initial
begin
fork
	#1000000 t1;
	#2000000 t2;
join
#500000 t3;
end
*/
endmodule 
