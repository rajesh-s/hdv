module test2(input clk);
reg [3:0] a,b;
initial
	begin
		a= 4'b1100;
		b= 4'b1111;
	end
always@(posedge clk)begin
	a<=b;// Enforcing concurrency even under sequential begin-end construct
//always@(posedge clk)
	b<=a;
end
initial
	$monitor($time,"a = %b b = %b",a,b);
endmodule
