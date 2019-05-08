module assert_check;
bit a,clk,done,sent;
bit b;
bit rst;
bit grant,req;
//assert property
//(@(posedge clk) $rose(a) |-> ##[1:3]  $rose(b) );
//(@(posedge clk) rst ##20  !rst);// With or without implication operator 
// Done must be asserted in the next clock tick after the sent has been asserted
assert property
//(@(posedge clk)sent -> ##1 done);
(@(posedge clk) grant |->$fell(req));
endmodule
