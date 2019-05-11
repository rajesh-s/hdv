/* Declare a queue a. Assign 5 values to it.Print the first and last element. Insert 45 val at the end of the 
array & insert 54 at the start of the array. Then delete the first element. Now insert 23 between the 
first and second element */
module queue_example2;
int a[$] = {1,2,3,4,5};

initial
begin
	$display("First element is %0d",a[0]);
	$display("Last element is %0d",a[$]);
	a.push_back(45);	
	a.push_front(54);	
	a.delete(0);
	a.insert(1,23);
	$display("Result : %p",a);
end
endmodule
