module test_randomize;
integer a;
/*initial
begin
	for(int i=0;i<6;i++)
		if(randomize(a))// Random generator. Broader random. No constraints
			$display("Randomization successful a = %0d",a);
		else
			$display("Randomization failed");
	$finish;
end
*/
// Use randomize with constraints aka generator and solver to get constrained random 
// Scope randomization based on the constraints using with keyword
integer min;
initial
begin
	min = 50;
	for(int i =0 ; i<100; i++)
		if(randomize(a) with {a<50;a>min;})// Inline constraints. Constraints separated with ;
			$display("Randomization successful: a = %0d",a);
		// Unlike $random it's always following constraints		
		else
			$display("Randomization failed");
	$finish;
end
endmodule
