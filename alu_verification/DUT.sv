`define CLK_PERIOD 10
`define REGISTER_WIDTH 32
`define INSTR_WIDTH 32
`define IMMEDIATE_WIDTH 32

module DUT(input clock, reset, enable_ex,  
input logic signed [`REGISTER_WIDTH-1:0] src1, src2, imm, mem_data_read_in,
input [6:0] control_in,
output logic signed [`REGISTER_WIDTH-1:0] aluout,mem_data_write_out,
output logic carry, mem_data_wr_en);

// Port declaration for the top level module according to system specification document

wire [31:0] aluin1_outd, aluin2_outd;
wire [2:0] operation_outd, opselect_outd;
wire [4:0] shift_numberd; 
wire enable_arithd, enable_shiftd;

// Instantiating the PREPROCESSOR DUT- Stage 1
EXECUTE_PREPROCESSOR dut1(
			.clock(clock),
			.reset(reset),
			.enable_ex(enable_ex),
			.src1(src1),
			.src2(src2),
			.imm(imm),
			.control_in(control_in),
			.mem_data_read_in(mem_data_read_in),
			.aluin1_out(aluin1_outd),
			.aluin2_out(aluin2_outd),
			.operation_out(operation_outd),
			.opselect_out(opselect_outd),
			.shift_number(shift_numberd),
			.enable_arith(enable_arithd),
			.enable_shift(enable_shiftd),
			.mem_data_wr_en(mem_data_wr_en),
			.mem_data_write_out(mem_data_write_out));

// Instantiating the ALU DUT- Stage 2
ALU dut2( .clock(clock),
	  .reset(reset),
	  .aluin1(aluin1_outd),
	  .aluin2(aluin2_outd),
	  .operation(operation_outd),
	  .opselect(opselect_outd),
	  .shift_number(shift_numberd),
	  .enable_arith(enable_arithd),
	  .enable_shift(enable_shiftd),
	  .aluout(aluout),
	  .carry(carry));


endmodule

