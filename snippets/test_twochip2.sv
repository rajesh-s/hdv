module test_twochip2;
logic clk,data_in,data_out;
always@(posedge clk)
data_out <= data_in;
always@(*)
data_out <= 1'b0;
endmodule
