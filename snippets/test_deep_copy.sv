class A;
int i;
endclass

class B;


module test_deep_copy;
initial
begin
B b1,b2;
b1 = new();
b1.a = new();A a;
task copy(A a);
this.a = new a;
endclass
b1.a.i = 100;
b2 = new b1;
b2.copy(b1.a);
$display("b1.a.i = %0d",b1.a.i);
$display("b2.a.i = %0d",b2.a.i);
b1.a.i = 400; // Only copies to b1 and not b2 in deep copy
$display("b1.a.i = %0d",b1.a.i);
$display("b2.a.i = %0d",b2.a.i);
end
endmodule

