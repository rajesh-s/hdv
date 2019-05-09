module test_std_randomize;
reg [3:0] r1,r2;

initial begin
	repeat(5)
	begin	
	std::randomize(r1,r2) with {// Similar to inline but this is standalone
	r1 < r2;
	r1 + r2 == 4;};
	$display("r1 = %0d, r2 = %0d",r1,r2);
	end
end
endmodule 	