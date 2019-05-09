module test_task_join;
task automatic print_val(input bit [7:0] value,delay);
#delay $display("delay_given: %0d, printing_time of:%0t ,value:%0d",delay,$time,value); 
// display values after delay of delay
endtask// 2 , 3 , 4
       // 5 , 6 , 8
       // 7 , 8 , 10
initial begin
fork
#1 print_val(10,7);// calling of task
#1 print_val(8,5);
#1 print_val(4,2);
join
$display("fork join : all threads finished ");
end
endmodule
