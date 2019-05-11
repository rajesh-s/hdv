module test3( input d,en, output logic y,q);

// Special procedural blocks- always_comb for Combination only logic generation
//always_comb 
//	y = a&b;
//always_comb
//	y = a|b;

//module D latch
//always_latch
//	if(en) q<=d;
//bit clk;
//always
//#5 clk++;

//Rand C example
//bit [2:0] e;
//initial
//begin
//repeat(8)
//begin
//	e = randc;
//	$display("%d",e);
//end
//end

reg [7:0] b = 8'b11110101;
reg a[7:0] = '{1,1,1,1,0,1,0,0};

initial
begin
	$display("a[0] = %b",a[0]);
	$display("b[0] = %b",b[0]);
	$display("b = %b",b);
	$display("a[1] = %b", a[1]);
	$display("a = %p",a);
end
endmodule
