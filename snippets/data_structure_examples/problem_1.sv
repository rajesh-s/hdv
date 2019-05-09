/*1. Declare a data structure for the following requirements:
	Add 100 integer values at sparse locations. Check if the value at index 2 and 45 exists. Print the value of first index along with the index.
	Print the value at the last index along with index. Check the array size. Delete 10th, 25th, 48th index if they exist. Print the array size again. */
module problem_1;
int mem[*];
int k,i;
initial
begin
repeat(105)
begin
k = $urandom_range(0,1000);
mem[k] = k;
end
$display("Randomly sparse location size is %d",mem.num);
$display(" Values are : \n %p",mem);
if(mem.exists(2))
	$display("Value at index 2 exists");
else
	$display("Value at index 2 does not exist");
if(mem.exists(45))
	$display("Value at index 45 exists");
else
	$display("Value at index 45 does not exist");
mem.first(i);
$display("The value at first index %d is %d",i,mem[i]);
mem.last(i);
$display("The value at last index %d is %d",i,mem[i]);
$display("Array size before deletion %d",mem.num);
if(mem.exists(10))
	mem.delete(10);
if(mem.exists(25))
	mem.delete(25);
if(mem.exists(48))
	mem.delete(48);
$display("Size after deletion is %d",mem.num);
end
endmodule
