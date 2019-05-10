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
	




$monitor($time,"ns : a = %b    b = %b  sel=%b  Output = %b  Carry = %b",a,b,sel,y,c);// Display statements 
	sel = 3'b000;	a = 4'b0001 ; b = 4'b0010;// Test vectors
#5			a = 4'b0010 ; b = 4'b0110;
#5			a = 4'b0001 ; b = 4'b0010;
#5			a = 4'b1001 ; b = 4'b1010;
#5	sel = 3'b001;	a = 4'b1111 ; b = 4'b1111;
#5      sel = 3'b010;	a = 4'b1001 ; b = 4'b1010;
#5      sel = 3'b011;	a = 4'b1001 ; b = 4'b1010;
#5      sel = 3'b100;	a = 4'b1001 ; b = 4'b1010;
#5      sel = 3'b101;	a = 4'b1001 ; b = 4'b1110;
#5      sel = 3'b110;	a = 4'b10XX ; b = 4'b1010;
#5      sel = 3'b111;	a = 4'b1001 ; b = 4'b1010;
#5      sel = 3'b1xxx;	a = 4'b1001 ; b = 4'b1010;
end
endmodule

