module problem_4;
byte q[$] = '{-1,-2,-3,4,8,127};
initial
begin
$display(" Sum of the elements of the queue is %d" , q.sum);
// Returns wrong number. Add elements individually after asssigning them to integer
q.sort;
$display("Sorted elements of queue are %p",q);
foreach(q[i])
begin
	if(q[i]>0)
		$display("Positive element %d at index %d",q[i],i);
	else
		$display("Negative element %d at index %d",q[i],i);
end
// or use find_index and find with (item>3)
q.shuffle;
$display("Shuffled elements of queue are %p",q);
end
endmodule
	