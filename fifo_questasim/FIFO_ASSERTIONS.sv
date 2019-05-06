module FIFO_ASSERTIONS 
	(clock,
	reset_n,
	read_n, // Active low signals
	write_n,
	over_flow,
	under_flow );

input logic reset_n,clock,read_n,write_n;
input logic under_flow,over_flow;

//RESET
sequence reset_seq;
((!under_flow) && (!over_flow));
endsequence

property reset_prty;
@(posedge clock) (!reset_n) |-> !under_flow ##0 !over_flow; //reset_seq;
endproperty

//FIFO UNDERFLOW
sequence underflow_seq;
((!under_flow) && (!read_n && write_n)) ;
endsequence

property underflow_prty;
@(posedge clock) underflow_seq[*16] |=> under_flow; // 16 Writes for the FIFO to be ful
endproperty

//FIFO OVERFLOW
sequence overflow_seq;
(!over_flow && !write_n && read_n);
endsequence

property overflow_prty;
@(posedge clock) overflow_seq[*16] |=> over_flow;
endproperty

RESET:assert property (reset_prty); // If failed returns a warning statement. 
FIFO_UNDERFLOW:assert property (underflow_prty);
FIFO_OVERFLOW:assert property (overflow_prty);

endmodule

