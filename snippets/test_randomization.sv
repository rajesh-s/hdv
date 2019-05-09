//Class Based Randomization

class test;
rand int a;
constraint c1 {a>100;}
constraint c2 {a<200;}
endclass

module test_randomization;
initial
begin
	test t1;
	t1 = new();
	repeat(10)
	begin
		if(t1.randomize())
			$display("%d",t1.a);