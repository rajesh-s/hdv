/*Define a class with variable a and b with size of 3. 
Randomize class properties 8 times such that each time a holds a different value*/
module problem_7;
class problem_7;
randc bit [2:0] a,b;// Use randc for unique values
endclass
problem_7 i;
initial
begin
	i = new();
	repeat(8)
		if(i.randomize())
			$display("a =%0d , b=%0d",i.a,i.b);
		else
			$display("Randomization failed");
end
endmodule
