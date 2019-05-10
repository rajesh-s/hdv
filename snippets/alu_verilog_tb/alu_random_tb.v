module alu_random_tb #(parameter WIDTH = 4);
//Test bench for ALU
reg [WIDTH-1:0] a,b;
reg [2:0] sel;
wire [WIDTH-1:0] y;
wire c;
// Declaring data types

alu uut(.a(a),.b(b),.sel(sel),.y(y),.c(c));
// Module Instantiation using Named associations
integer i;
initial 
begin
	$monitor($time,"ns : a = %d    b = %d  sel=%d  Output = %d  Carry = %d",a,b,sel,y,c);// Display statements 
	sel = 3'b000;	a = $random() ; b = $random();// Test vectors
#5			a = $random() ; b = $random();
#5			a = $random() ; b = $random();
#5			a = $random() ; b = $random();
#5	sel = 3'b001;	a = $random() ; b = $random();
#5      sel = 3'b100;	a = $random() ; b = $random();
repeat(10000)
begin
	sel = $urandom_range(0,9); a = $urandom_range(0,15); b = $urandom_range(0,16);
#10;
	sel = ~sel; a = ~a; b= ~b;
#10;
end
end
endmodule

