/* Define a class with dynamic array "a". 
Randomize class properties such that 
each element of the dynamic array has values greater than 7.*/
module problem_4;

class problem_4;
rand int a[];

constraint c1{foreach(a[i]) a[i]>7;}// Specify constraint for every element
endclass

problem_4 d;
initial
begin
	d = new();
	d.a = new[10];
	foreach(d.a[i])
	if(d.randomize())
		$display("%d",d.a[i]);
end
endmodule
