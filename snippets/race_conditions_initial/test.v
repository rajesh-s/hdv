module test;

initial begin
	#1	$display("Block 1 St 1");
	#0	$display("Block 1 St 2");
	#2      $display("Blcok 1 St 3");
end

initial begin
	#0	$display("Block 2 St 1");
	#2	$display("Block 2 St 2");
	#4      $display("Blcok 2 St 3");
end

endmodule
