class test2;
// local int i; Returns an error as LOCAL == PRIVATE and this var cannot be accessed from the module
int k;// Illegal access
task disp();
$display("%d",i);
endtask
endclass

module test_class_2;
initial
begin
test2 t1;
t1 = new();
t1.k = 50;
t1.disp();
end
endmodule
