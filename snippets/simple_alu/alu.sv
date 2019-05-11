module alu #(parameter WIDTH =4)(input [WIDTH-1:0] a,b, input [2:0] sel ,output reg [WIDTH-1:0] y,output reg c);
parameter ADD = 3'b000, // Non global parameters
	  SUB = 3'b001,
	  INC = 3'b010,
	  DEC = 3'b011,
	  AND = 3'b100,// and is a reserved primitive
	  OR  = 3'b101,
          XOR = 3'b110,
	  CMP = 3'b111;
always@(sel,a,b)
begin 
	c = 1'b0;
	case(sel)
	3'b000://ADD
	        begin
			{c,y} = a + b;
	        	$display("Addition out is %d" ,y);// Don't write display statements inside design file. Preferably testbench
		end
	3'b001://SUB 
		{c,y} = a - b;
	3'b010://INC
		{c,y} = a + 1'b1; // Bitwise or. Cannot use or(out,inputs)
	3'b011://DEC 
		{c,y} = b - 1'b1; // Decrement 
	3'b100://AND
		y = (a & b); // And operation.Nand. Direct nand operator for binary not supported
	3'b101://OR 
		y = (a | b); // or (Bitwise or)
	3'b110://XOR 
		y = {a ^ b}; // xor
	3'b111://CMP 
		y = ~a;// complement operation	
	default: begin
		 $display("Invalid inputs");
		 y = {WIDTH{1'bx}};
		 end 
endcase
end 
endmodule
