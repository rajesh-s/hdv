module test_posedge;
bit a,b,c,d,clk;
assert property
(@(posedge clk) $rose(a|b|c) -> d);
endmodule
