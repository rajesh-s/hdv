module test_randcase;
int x;
initial
begin
	for(int i=0; i<16; i++)
	begin
		randcase
			1: x = 1;// Based on weightage of the LHS probablity . Have more repetitions or make the LHS distributive
			2: x = 2;// Weights should not be same 
			3: x = 3;
			9: x = 4;
		endcase
		$write("%d",x);
	end
end
endmodule

