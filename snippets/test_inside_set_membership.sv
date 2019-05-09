module test_inside_set_membership;
logic [3:0] a;
bit c;
//Packet constraints
assign c =  ! (a inside {[0:7]});// Checks if a is a member of the list Eg: a inside [0:7] or !(a inside[0:7])  for outside
initial
begin
	if(c)
		$display("Yes");
	else
		$display("No");
end
endmodule
