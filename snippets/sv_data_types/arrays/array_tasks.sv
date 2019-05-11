/* Declare a dynamic array, allocate the array size of 12 locations assign random values double
the array size by keeping the content of the first 12 locations same and print the values of remaining 
elements using foreach */
module array_tasks;
int d[];
initial
begin
	d = new[12];
	foreach(d[i])
		d[i] = $urandom_range(20);
	d = new[24](d);
	foreach(d[i])
		$display("Element %d  = %d",i,d[i]);
end
endmodule
