/*Define a class with variable a and b with size of 3. Randomize
 class properties such that b can have a value of 4 or 5 whereas a should always be zero.*/
module problem_5;
class problem_5;
rand bit [2:0] a,b;
constraint c1{ b==4 | b==5; a==0;}// Can only use conditional operators here. Without or it will fail randomization
endclass
problem_5 i;
initial
begin
	i = new();
	repeat(10)
		if(i.randomize())
			$display("a =%0d , b=%0d",i.a,i.b);
		else
			$display("Randomization failed");
end
endmodule

