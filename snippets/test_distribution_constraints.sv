`define WIDTH 32
module test_distribution_constraints;
class test_distribution_constraints;
rand bit[`WIDTH-1:0] src,dst;
constraint c_dist{ 
src dist {0:=40, [1:3]:=60};// Computes sum individually. := operator
// src = 0, weight = 40/220
// src = 1, weight = 60/220
// src = 2, weight = 60/220
// src = 3, weight = 60/220
dst dist {0:/40, [1:3]:/60}; // DO NOT USE DISTRIBUTION CONS WITH RANDC- RANDC THINKS ALL CONSTRAINTS HAVE EQUAL PROBABILITY
}
// dst = 0, weight = 40/100
// dst = 1, weight = 20/100
// dst = 2, weight = 20/100
// dst = 3, weight = 20/100
endclass
int k = 3;
int temp = {k{1'b1}};
test_distribution_constraints t1;

initial
begin
	t1 = new();
	repeat(100)// Repeat needs to be large to observe the specific weightage pattern
	if(t1.randomize())
		$display("src = %0d  dst = %0d",t1.src,t1.dst);
	else
		$display("Randomization failed");
	
$display("%b",temp);

end
endmodule

