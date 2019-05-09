/*Define a class with vars A and B. Generate 
random values 5 times and print them. Overwrite the value of A to 55 after randomization*/
module problem_9;

class problem_9;
rand int a,b;
endclass

problem_9 p;

initial 
begin
	p = new();
	repeat(5)
	if(p.randomize())
		$display("a= %0d , b=%0d",p.a,p.b);
	else
		$display("Randomization failed");
	p.a = 55;
	$display(" Value after randomization");
	$display(" a=%0d b=%0d",p.a,p.b);
end
endmodule
