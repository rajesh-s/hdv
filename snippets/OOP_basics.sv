module ABC;
class A;
static int a =1;
//local int b =2;
//protected int c =3;
//int d =4;
task disp();
$display("%d",a);
endtask
endclass

class B;
task disp();
$display("%d",a);
endtask
endclass

class C;
task disp();
$display("%d",a);
endtask
endclass

initial
begin
	A a1;
	B b1;
	C c1;// ABC.sv(14): Failed to find 'a' in hierarchical name '/a'
	a1 = new();
	b1 = new();
	c1 = new();
	a1.disp();
	b1.disp();
	c1.disp();
end
endmodule
