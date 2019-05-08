module test1
( input a,b,s,
output reg y);
reg m = 1'b0,p= 1'b1;

always@(a,b)
fork 
	if (s)
		y = a;
	else
		y = b;
	y = m & p;






join
endmodule
