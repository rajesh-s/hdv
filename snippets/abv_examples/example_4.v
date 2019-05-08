module example_4(
input clk,req,
output reg grant);
integer count = 1'b0, countdown;
always@(posedge clk)
begin
	if(req)
	begin
		count = count + 1;
		countdown =4 ;
 	end
	else if(count == 2)
	begin
		countdown = countdown - 1'b1;
		if(countdown == 1'b0)
		begin
			grant = 1'b1;
			count = 1'b0;
		end
	end
	else
		grant = 1'b0;
end
endmodule
	