module problem_12;
class problem_12;
rand int b,c,d;
constraint c1{ c>=30; b==c; d >b; d<55;}// Can only use conditional operators here. Without or it will fail randomization
endclass
problem_12 i;
initial
begin
	i = new();
	repeat(10)
		if(i.randomize())
			$display("b =%0d , c=%0d , d=%0d",i.b,i.c,i.d);
		else
			$display("Randomization failed");
end
endmodule
