module example_3(
input a,clk,
output reg b);

reg [1:0] count = 2'b00; integer fixed = 2'b00;
reg start = 1'b0;
always@(posedge clk or negedge a)
begin
	if(a)
		begin
			count = count + 1'b1;
			fixed = count - 1'b1 ;
			start = 1'b1;
		end
	else 
	begin
		if(start == 1'b1)
		begin
		if(fixed == 1'b0)
		begin
		  	b = 1'b1;
			start = 1'b0;
			fixed = 1'b1;
		end
		fixed = fixed - 1'b1;
		end
	else
			b = 1'b0;
		
end
end
endmodule
