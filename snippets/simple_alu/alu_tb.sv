module alu_tb #(parameter WIDTH = 4);
//Test bench for ALU
reg [WIDTH-1:0] a,b;
reg [2:0] sel;
wire [WIDTH-1:0] y;
wire c;
// Declaring data types

alu uut(.a(a),.b(b),.sel(sel),.y(y),.c(c));
// Module Instantiation using Named associations

initial 
begin
	$monitor($time,"ns : a = %d    b = %d  sel=%d  Output = %d  Carry = %d",a,b,sel,y,c);// Display statements 
	sel = 3'b000;	a = $urandom; b = $urandom;// Test vectors
#5			a = $urandom ; b = $urandom;
#5			a = $urandom ; b = $urandom;
#5			a = $urandom ; b = $urandom;
#5	sel = 3'b001;	a = $urandom ; b = $urandom;
#5      sel = 3'b100;	a = $urandom ; b = $urandom;
repeat(10)
begin
	sel = $urandom_range(7); a = $urandom_range(1,6); b = $urandom_range(2,8);
#10;
end
end
endmodule
