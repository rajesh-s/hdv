module assoc_test;
//Arrays mapped as an LUT
bit [31:0] mem [*]; //= '{7:7,73:83,21:21}; Alternate initialization similar to dynamic array
bit [31:0] i;
initial
begin
	mem[7] = 7;
	mem[83] = 83;
	mem[21] = 21;
	mem[122] = 122;
	mem[177] = 177;
	mem[200] = 200;
	$display("Size of array is = %0d",mem.num);// To find size of assc array
	$display("mem[15] = %0d",mem[15]);// Non existent element 
	$display("mem[200] =%0d",mem[200]);
	mem.first(i);// Method to get index of first element of assc array
	$display("The first index is %0d",i);
//mem.prev(i);
//$display(" disp %d",i); displays the first element index itself since prev doesnt exist
// built in function jumps to that location with the index i containing the trasaction
	mem.next(i);// Method to get index of next element
	$display("The next index to first index is %0d",i);
	mem.last(i);// Method to get last element of associative array
	$display("The last index of assc array is %0d",i);
	mem.prev(i);
	$display("The previous index to last index is %0d",i);
	mem.delete(i);
$display("%d",mem.sum);
	$display("The deleted index is %0d",i);
	if(mem.exists(i))
		$display("Element at index %0d exists",i);
	else
		$display("Does not exist");
	mem.delete;
	$display("%p",mem);
end
endmodule

