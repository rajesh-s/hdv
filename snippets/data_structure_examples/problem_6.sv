/*Define 1 task which holds 3 arguments i. device no. i/p ii. time to get device ready i/p  
iii. o/p flag which indicates device is ready. Call this task 3 times with different device 
no. and time. When anyone of the device is available resume the other process.*/
`timescale 1ns/1ps
module problem_6;
bit oflag;
task device_test(input integer dno,dready);
#dready oflag =1'b1;
$display($time, ": Device no: %0d is now with ready with o/p flag %0d",dno,oflag);
oflag = 1'b0;
endtask

initial
fork
device_test(1,2);
device_test(2,4);
device_test(3,6);
join_any

endmodule
