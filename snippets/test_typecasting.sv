module test_typecasting;
logic [63:0] y;
//real c=3;
reg [11:0] a,b;
real r = 2.5;
int c = 2;
int rad = 3;
real area;
initial
begin
	//a = -2; b =1;
	//y = (c+(b+a));// Typecasting to type int signed '(c**(b+a)d
	//a = 2 ; b = -1;	
	//c = (a+b) ** r;
	//$display("%d",c);
	area = 3.1 * rad*rad;
	$display(area);

end

endmodule
