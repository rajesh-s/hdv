/* Design a memory having a width of 8 bits. Assign different values to 
locations 34,56,87. Display the number of elements. Delete element 56.
Display the first and last element
*/
module array_tasks2;
reg [7:0] mem [];// Number of locations of word size 8 is defined dynamically
reg [7:0] newmem[];
int j = 0;
initial
begin
	mem = new[100];
	newmem = new[99];
	mem[34] = 1;
	mem[56] = 2;
	mem[87] = 3;
	$display("Size of array is %d",mem.size);
	foreach(mem[i])
		begin
			if(i<56 | i>56)
			begin
				newmem[j] = mem[i];
				j++;
			end
		end
	$display("First Element is %d",mem[0]);
	$display("Last Element is %d",mem[98]);
end
endmodule
