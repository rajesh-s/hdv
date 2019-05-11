/* Declare an integer queue, initialize it with 10 elements. Insert an element at the beginning
without any method. Insert an element at the end without using predefined method. Get the first element 
in the queue. Get the last element of the queue. Insert an element at index 7. Delete an element at index 9.y*/

module queue_example1;

int q[$] = {1,2,3,4,5,6,7,8,9,10};
int count = 0;
initial
begin
	q = {0,q};
	$display("After insertion: %p",q);
	q = {q,11};
	$display("After second insertion: %p",q);
	$display("First element is %0d",q[0]);
	q = q[1:$];
	$display("Get first element  %p",q);
	$display("Last element is %0d",q[$]);
	q = q[0:$-1];
	$display("Get last element %p",q);
	q = {q[0:6],11,q[7:$]};// Insert 11 at 7th index
	$display("Inserting 11 at 7th index %p",q);
	q = {q[0:8],q[10:$]};
	$display("Deleting 9th index element %p",q);

	foreach(q[i])
		count++;
	$display("Size is %0d",count);
end
endmodule
