module test_randc;

class test_randc;
//rand - SInce randomize fn is used
// Use explicitly mentioned rand type in classes - Practice
rand bit[3:0] a,b,c;
randc bit[3:0] d; // Cyclic random generation. eg *3* 2 1 0 3 won't repeat until the rest is generated
// Used in Scheduling and Round Robin methods to generate random testcases
constraint c1{a>3; b<5; c==8; d>10;}// Or use conditions like a>b , b<10- Bidirectional LHS as well as RHS same vars
endclass

initial
begin
	test_randc t1;
	t1 = new();
	repeat(16)// D is never repeated in the sequence from 0 to 15. Rest are repeated
	// For randc to work the size must be limited to 16 without repetitions. To generate more test cases repeat 16 in another loop
	// Only for two state data types
	if(t1.randomize(a,b))
		$display("Randomization successful : %0d %0d %0d %0d",t1.a,t1.b,t1.c,t1.d);
	else
		$display("Randomization failed");
	$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
	repeat(16)// D is never repeated in the sequence from 0 to 15. Rest are repeated
	// For randc to work the size must be limited to 16 without repetitions. To generate more test cases repeat 16 in another loop
	if(t1.randomize())
		$display("Randomization successful : %0d %0d %0d %0d",t1.a,t1.b,t1.c,t1.d);
	else
		$display("Randomization failed");
end
endmodule


/*Cyclic random repeitions must be limited to the max boundary to get unique elements. Use multiple repeat(16) constructs
to get all unique values. Used in applications for different sequence generation

if(t1.randomize(<variable/s>) Randomizes only that variable that has been specified. Implements filtering
 
rand keyword is needed to use constraints in a class 

randc is only for 2 state data types ( can only be bit or enum

Inline constraints with operator
eg. constraint c{ z == x+y;}
success = p.randomize with {x<y}; */