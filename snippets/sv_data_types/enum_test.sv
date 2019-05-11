typedef enum bit [3:0] {idle,go,job[10],stop,done}test;
module enum_test;
test f1;
always #5 f1 <= f1.next();// Or f1.next;
initial
$monitor("Fsm now is to %d {%s}",f1,f1.name);
endmodule
