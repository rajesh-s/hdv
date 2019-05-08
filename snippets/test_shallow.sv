class A;
int i;
endclass

class B;
A a;
endclass

module test_shallow;
initial
begin
B b1,b2;
b1 = new();
b1.a = new();
b1.a.i = 100;
b2 = new b1; // similar to mailboxgenerator driver implicit new
//b2 = new b1;
//b2 = b1;
$display("b1.a.i = %0d",b1.a.i);
$display("b2.a.i = %0d",b2.a.i);
//b2.a.i = 200;
b1.a.i = 200;
$display("b1.a.i = %0d",b1.a.i);
$display("b2.a.i = %0d",b2.a.i);
end
endmodule
