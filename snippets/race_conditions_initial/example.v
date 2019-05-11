module example(output reg y,input a,b);

always@(a,b)
	#0	y = a & b;
always@(a,b)
		y = a | b;
initial
	$display("Value of a is %b b is %b",a,b);
endmodule
