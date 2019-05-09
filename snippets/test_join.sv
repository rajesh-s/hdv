module test_join;
initial
begin
fork
	 begin #5 $display("Exit first process at t = %d ",$time); end 
	 begin #10 $display("Exit second process at t = %d",$time); end 
join_none
#1 $display("Exit fork_join at t = %d",$time);// join_none 0  5 10 , join_any 5 5 10 , join 5 10 10
end
endmodule
