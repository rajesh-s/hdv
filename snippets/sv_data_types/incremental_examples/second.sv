module second;
integer second_1 [0:4] = '{1,2,3,4,5};
bit [31:0] second_2 [0:4];
initial
begin
	for(int k=0; k<5; k++)
	begin
		second_2[k] = second_1[k];
		$display("second_2[%0d] = %0d",k,second_2[k]);
	end
end

endmodule
