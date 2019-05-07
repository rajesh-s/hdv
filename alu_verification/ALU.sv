`define REGISTER_WIDTH 32
module ALU(
	input clock,reset,enable_arith,enable_shift,
	input [`REGISTER_WIDTH-1:0] aluin1,aluin2,
	input [2:0] operation,opselect,
	input [4:0]shift_number,
	output logic signed [31:0] aluout,
	output bit carry);

// Port declaration

logic [32:0] temp0,temp1;
logic d_out;
// Temporary logic variables for mux input connections

ARITH_ALU a1 (.clock(clock),.reset(reset),.aluin1(aluin1),.aluin2(aluin2),
			              .aluoperation(operation),.aluopselect(opselect),.enable(enable_arith),.aluout(temp0));

SHIFT_ALU s1 (.clock(clock),.reset(reset),.in(aluin1),.shift(shift_number),
	      			      .shift_operation(operation), .enable(enable_shift),.aluout(temp1));

// Instantiate the ARITH_ALU and SHIFT_ALU submodules

always@(posedge clock)
begin
	if(reset)
		begin
			aluout <= 32'b0;
			carry <= 1'b0;
		end
	else
		begin
			if(~d_out)
				begin
					carry <= temp1[32];
					aluout <= temp1[31:0];
				end
			else
				begin
					carry <= temp0[32];
					aluout <= temp0[31:0];
				end				
		end
end

// Synchronous D Flip Flop logic for output selection either from ARITH_ALU or SHIFT_ALU
always@(posedge clock)
begin
	if(reset)
		d_out = 1'b0;
	else
		begin 
			if(enable_arith)
				d_out = 1'b1;
			else
				d_out = 1'b0;
		end
end
endmodule

