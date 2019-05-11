/* A testbench to test dynamic array datatype and predefined methods by
using the following statements. d,d1 of type int dynamic array. Initialize 
d array elements with 9,1,8,3,4,4. Allocate d with 6 elements and initialize
values with the index. Display the size and elements. Delete d1. Try to 
print the values of d in sorting and reverse sorting order*/ 
module array_tasks3;

int d[],d1[];
int temp1;

initial
begin
	d = new[6];
	d1 = new[6];
	d = '{9,1,8,3,4,4};
	foreach(d1[i])
		begin
			d1[i] = i;
			$display("d1[%0d] = %0d",i,d1[i]);
		end
	$display("Size of d1 is %0d",d1.size);
	d1.delete;
	for(int i=0;i<6;i++)
		for(int j=0;j<5;j++)
			if(d[j+1] < d[j]) 
				begin
				temp1 = d[j+1];
				d[j+1] = d[j];
				d[j] = temp1;
				end
	foreach(temp[i])
		$display("Sorted in ascending is %d ",d[i]);// Use d.sort()
	foreach(temp[i])
		$display("Sorted in descending is %d",d[5-i]);// Use d.rsort()
end
endmodule
	