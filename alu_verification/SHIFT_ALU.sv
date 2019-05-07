//SHIFTING OPERATIONS
`define SHLEFTLOG 3'b000
`define SHLEFTART 3'b001
`define SHRGHTLOG 3'b010
`define SHRGHTART 3'b011

`define REGISTER_WIDTH 32

module SHIFT_ALU(
input clock,reset,enable, input [2:0] shift_operation, input [4:0] shift,
input logic signed [`REGISTER_WIDTH-1:0] in, output logic signed [32:0] aluout);

//Port declaration for the SHIFT_ALU
// shift is a 5-bit input to specify the number of shifts operand
// shift operation specifies logic/arithmetic and right/left selection
//input in is a 32-bit operand
// aluout is a 33-bit output that concatenated the 32-bit shifted output and the carry bit.

always@(posedge clock)
begin
	if(reset)
		aluout <= 32'b0;
	else
		if(enable)
			case(shift_operation)
		 	`SHLEFTLOG: begin
					aluout[32] <= 1'b0;
					//{aluout[31:shift],aluout[shift-1:0]} <= {in[31-shift:0],{shift{1'b0}}}; Trial to implement without the use of >> operator
					aluout[31:0] <= in << shift;
			            end
			`SHLEFTART: begin
					//{aluout[31:shift],aluout[shift-1:0]} <= {in[31-shift:0],{shift{1'b0}}};
					aluout[31:0] <= in <<< shift;
					if(in[31] == 1'b1)
						aluout[32] <= 1'b1;
					else
						aluout[32] <= 1'b0;
				    end
			`SHRGHTLOG: begin
					aluout[32] <= 1'b0;
					aluout[31:0] <= in >> shift;
					//{aluout[31:shift],aluout[shift-1:0]} = {{shift{1'b0}},in[31:shift]};
				    end
			`SHRGHTART: begin
					aluout[32] <= 1'b0;
					aluout[31:0] <= in >>> shift;
				    	/*if(in[31] == 1'b1)
						{aluout[31:shift],aluout[shift-1:0]} = {{shift{1'b1}},in[31:shift]};
					else
						{aluout[31:shift],aluout[shift-1:0]} = {{shift{1'b0}},in[31:shift]};*/    
				    end
			   default: aluout <= aluout;
			endcase
		else
			aluout <= aluout;
end
endmodule
