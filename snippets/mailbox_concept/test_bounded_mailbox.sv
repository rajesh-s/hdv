module test_bounded_mailbox;
mailbox mbx;
initial
begin
mbx = new(1); // Mailbox of size 1 
fork 
	for(int i=1; i<4; i++)
	begin		
		$display("@%0d : Producer : putting %0d", $time, i);
		mbx.put(i);
		$display("@%0d : Producer : put (%0d) done %0d",$time,i,i);
		$display("Size of mailbox produce %0d",mbx.num); // Size depends only on the new keyword
	end
	repeat(3) // This size even if it is greater than 3 does not have any effect of getting the data. No duplicates got
	begin
		int j;
		#1ns mbx.get(j); // mbx is emptied 1ns after put
		$display("@%0d: Consumer: got %0d",$time,j);
	end
join_any
// join_none will immediately after beginning for join
// join will print the display after join 
// Since the mailbox size is limited to 1, it can put only one thing at a time. Hence we do not get the done message beyond 1 message
// The future components can be put only after each element has been got
end
endmodule
