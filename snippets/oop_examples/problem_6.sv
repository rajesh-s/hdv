/*Define a class with variable a and b with size of 3. 
Randomize class properties 10 times such that a should 
have value b/w 5 to 7 and b should be either 4 or 6*/
module problem_6;
class problem_6;
rand bit [2:0] a,b;
constraint c1{ b==4 | b==6; a>5; a<7;}// Can only use conditional operators here. Without or it will fail randomization
endclass
problem_6 i;
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
