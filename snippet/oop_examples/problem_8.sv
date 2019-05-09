/*Declare class A,B and C. Class C has 3 different variables p,q and r. 
Randomize class C properties inside class A and transfer randomized class C properties  
to B.*/
module problem_8;


class problem_8_C;
rand static int p,q,r;// STATIC will hold the value for transfer into B
endclass

class problem_8_A extends problem_8_C;// Can be randomized here as well. Using randomize()
task randomize();// Using an object of class C
problem_8_C c1;
c1 = new();

endclass


class problem_8_B extends problem_8_A;
int a,b,c;
task transfer();// Need this for initialization
a=p; b=q; c=r;
endtask
endclass

problem_8_A a1;
problem_8_B b1;

initial
begin
	a1 = new();
	b1 = new();
	repeat(5)
	if(a1.randomize())
		$display(" Randomize in class A p = %0d q = %0d r = %0d",a1.p,a1.q,a1.r);
	else
		$display("Randomization in class A failed");
	b1.transfer();
	$display("Transferred values to B a = %0d, b = %0d, c = %0d",b1.a,b1.b,b1.c);
end
endmodule
