module array_methods;
int q[$] = {1,11,7,9,2,5,5};// Methods on dynamic/queue. No need to use `. Element methods

initial
begin

	foreach(q[i])
		$display("q[%0d] = %0d",i,q[i]);
	$display("AND Operation : %0d",q.and);
	$display("Or Operation : %0d",q.or);
	$display("Xor Operation : %0d",q.xor);
	$display("Sum Operation : %0d",q.sum);
	$display("Product Operation : %0d",q.product);
	$write("Sorted array is : ");
	q.sort;
	$display(" Sorted Array is : %p",q);
	q.rsort;
	$display(" Reverse Sorted Array is : %p",q);
	q.shuffle;
	$display(" Shuffled Array is : %p",q);
	q.reverse;
	$display(" Reverse Array is : %p",q);
	$display(" Unique elements is : %p",q.unique);
	$display(" Maximum element is : %p",q.max);
	$display(" Minimum element is : %p",q.min);
//$display(" Index is : %p",q.findindex with(1));
end
endmodule
	