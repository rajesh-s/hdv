`define CLK_PERIOD 10
`define REGISTER_WIDTH 32
`define INSTR_WIDTH 32
`define IMMEDIATE_WIDTH 16

`define MEM_READ 3'b101
`define MEM_WRITE 3'b100
`define ARITH_LOGIC 3'b001
`define SHIFT_REG 3'b000


module EXECUTE_PREPROCESSOR(
	input clock, reset, enable_ex,
	input logic signed [`REGISTER_WIDTH-1:0] src1, src2, imm, mem_data_read_in,
	input [6:0] control_in,
	output logic mem_data_wr_en, enable_arith, enable_shift,
	output logic signed [`REGISTER_WIDTH-1:0] aluin1_out, aluin2_out, mem_data_write_out,
	output logic [4:0] shift_number,
	output logic [2:0] operation_out, opselect_out);


// Output logic for aluin1_out
always@(posedge clock)
begin
	if(reset)
		aluin1_out <= 32'b0;
	else
		if(enable_ex)
			aluin1_out <= src1;
		else
			aluin1_out <= aluin1_out;// No change
end

//Output logic for aluin2_out
always@(posedge clock)
begin
	if(reset)
		aluin2_out <= 32'b0;
	else
		if(enable_ex)
			case(control_in[2:0])// opselect = control_in[2:0]
				`ARITH_LOGIC: begin
					      	if(control_in[3])
							aluin2_out <= imm;
						else
							aluin2_out <= src2;
					      end
				   `MEM_READ: begin
						if(control_in[3])
							aluin2_out <= mem_data_read_in;
						else
							aluin2_out <= aluin2_out;
					      end
				     default: aluin2_out <= aluin2_out;
			endcase
		else
			aluin2_out <= aluin2_out;
end

//Output logic for operation_out
always@(posedge clock)
begin
	if(reset)
		operation_out <= 3'b0;
	else
		if(enable_ex)
			operation_out <= control_in[6:4];
		else
			operation_out <= operation_out;
end

//Output logic for opselect_out
always@(posedge clock)
begin
	if(reset)
		opselect_out <= 3'b0;
	else
		if(enable_ex)
			opselect_out <= control_in[2:0];
		else
			opselect_out <= opselect_out;
end

//Output logic for shift_number
always@(posedge clock)
begin
	if(reset)
		shift_number <= 5'b0;
	else
		if(enable_ex)
			case(control_in[2:0])// opselect
				`SHIFT_REG: begin
						if(imm[2])
							shift_number <= src2[4:0];
						else
							shift_number <= imm[10:6];
					    end		
				    default: shift_number <= 5'b0;
			endcase
		else
			shift_number <= 5'b0;
end

//Output logic for enable_arith
always@(posedge clock)
begin
	if(reset)
		enable_arith <= 1'b0;
	else
		if(enable_ex)
			case(control_in[2:0])// opselect
				`ARITH_LOGIC: enable_arith <= 1'b1;
			
				   `MEM_READ: begin
						if(control_in[3])
							enable_arith <= 1'b1;
						else
							enable_arith <= 1'b0;
					      end
				     default: enable_arith <= 1'b0;
			endcase
		else
			enable_arith <= 1'b0;
end

// Output logic for enable_ex
always@(posedge clock)
begin
	if(reset)
		enable_shift <= 1'b0;
	else
		if(enable_ex)
			case(control_in[2:0])//opselect
				`SHIFT_REG: enable_shift <= 1'b1;
				   default: enable_shift <= 1'b0;
			endcase
		else
			enable_shift <= 1'b0;
end

// Output logic for mem_data_write_out 
always@(posedge clock)
begin
	mem_data_write_out <= src2;
	if((control_in[2:0] == `MEM_WRITE) && (control_in[3] == 1'b1))//opselect = control_in[2:0] immp_regn_op = control_in[3]
		mem_data_wr_en <= 1'b1;
	else
		mem_data_wr_en <= 1'b0;
end
endmodule
