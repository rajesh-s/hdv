module example_2 (in1,in2,and_out,or_out);
input in1,in2;
output and_out, or_out;
assign or_out = in1 | in2;
assign and_out = in1 & in2;
always_comb begin
assert(^{in1,in2} !== 1'bx)
else $fatal("Logic inputs = X");
//fatal,info,error,warning
// fatal finishes the simulation
endaad
endmodule
