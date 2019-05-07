`define REGISTER_WIDTH 32
// ARITHMETIC OPERATIONS
`define ADD 3'b000
`define HADD 3'b001
`define SUB 3'b010
`define NOT 3'b011
`define AND 3'b100
`define OR 3'b101
`define XOR 3'b110
`define LHG 3'b111

//ALU OP SELECT MAPPING
`define MEM_READ 3'b101
`define MEM_WRITE 3'b100
`define ARITH_LOGIC 3'b001
`define SHIFT_REG 3'b000

//DATA TRANSFER OPERATIONS
`define LOADBYTE 3'b000
`define LOADBYTEU 3'b100
`define LOADHALF 3'b001
`define LOADHALFU 3'b101
`define LOADWORD 3'b011

module ARITH_ALU(
input clock,reset,enable, 
input logic signed  [31:0] aluin1,aluin2, 
input [2:0] aluoperation, aluopselect,
output logic signed [32:0] aluout);


// Declaration of ports
// aluin1 , aluin2 are the two operand inputs
// aluoperation specifies the specific operation either arithmetic or memory. 
// aluopselect specifies the classification of operation arithmetic or memory based.
// Allows mapping more functions for the given instruction width
// 33-bit ALU concatenates both the 32-bit aluout result and carry bit

logic h_carry;
logic [15:0] h_add;

// Temporary logic variables to hold intermediate results

always@(posedge clock)// Or use always_comb to ensure pure combinational logic synth.
begin
	if(reset)
		aluout = 33'b0;// Reset operation for ACTIVE HIGH RESET
	else 
		if(enable)
			case(aluopselect) 
				`ARITH_LOGIC:begin
						case(aluoperation)
						`ADD: begin
							{aluout[32],aluout[31:0]} = aluin1 + aluin2; // Signed addition
						      end// Implement typecasting here if logic signed need to be removed
					       `HADD: begin
							{h_carry,h_add[15:0]} = aluin1[15:0] + aluin2[15:0];
							 aluout[32] = h_carry; aluout[31:0] = sxt(h_add);
						      end
						`SUB: begin
							{aluout[32],aluout[31:0]} = aluin1 - aluin2;
						      end
						`NOT: begin
							aluout[32] = 1'b0; aluout[31:0] = ~(aluin2);
						      end
						`AND: begin
							aluout[32] = 1'b0; aluout[31:0] = (aluin1 & aluin2);
						      end
					         `OR: begin
							aluout[32] = 1'b0; aluout[31:0] = (aluin1 | aluin2);
						      end
						`XOR: begin
							aluout[32] = 1'b0; aluout[31:0] = (aluin1 ^ aluin2);
						      end
						`LHG: begin
							aluout[32] = 1'b0; {aluout[31:16],aluout[15:0]} = { aluin2[15:0], 16'b0};
						      end
						 default: aluout = aluout;
						 endcase 
					   end	
			          `MEM_READ: begin
						case(aluoperation)
					        `LOADBYTE: begin
							     aluout[32] = 1'b0; aluout[31:0] = signext(aluin2[7:0]);
				                           end
					       `LOADBYTEU: begin	        
							     aluout[32] = 1'b0; aluout[31:0] = zpad(aluin2[7:0]);
						           end
					        `LOADHALF: begin
							     aluout[32] = 1'b0; aluout[31:0] = signext(aluin2[15:0]);
							   end
					       `LOADHALFU: begin
							     aluout[32] = 1'b0; aluout[31:0] = zpad(aluin2[15:0]);
						           end
					        `LOADWORD: begin
							     aluout[32] = 1'b0; aluout[31:0] = aluin2;
							   end
						  default: begin
							     aluout[32] = 1'b0; aluout[31:0] = aluin2;
							   end
						endcase
					      end
				    default: begin
				         	aluout = aluout;
					     end
			endcase
end
	
function logic signed [31:0] sxt(input logic signed [15:0] in); // Function for 16 bit signed extension
	{sxt[31:16],sxt[15:0]} = {{16{in[15]}},in[15:0]};
endfunction

function logic signed [31:0] signext(input logic signed [7:0] in);// Function for 8 bit sign extension
	{signext[31:16],signext[15:0]} = {{16{in[7]}},in[7:0]};
endfunction

function logic signed [31:0] zpad(input logic signed [7:0] in);// Function for zero pad logic
	{zpad[31:16],zpad[15:0]} = {{16{1'b0}},in[7:0]};
endfunction

endmodule
