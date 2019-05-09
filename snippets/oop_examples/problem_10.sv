/*Define a class with vars u,v and w. 
Generate 10 random values of u and v with the fixed value of w = 70.*/
module problem_10;
class problem_10;
rand int u,v,w;
constraint c1{w==70;}
endclass

problem_10 p;

initial
begin
	p = new();
	repeat(10)
		if(p.randomize())
			$display(" u=%0d v=%0d w=%0d",p.u,p.v,p.w);
		else
			$display(" Randomization failed");
end
endmodule
