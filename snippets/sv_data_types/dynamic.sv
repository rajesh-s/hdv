module dynamic;
int d[];
initial
begin
	d = new[5];// Constructor to allocate memory for the array. Storage of elements does not work
//$display("%p",d);
	d[0]= 75;
	d[2] = 13;
	//foreach(d[i])// Initialization
	//	d[i] = 5;
	d = new[10](d);// Resizes d from 5 to 10 memory locations. First 5 are preserved
	$display("%d", d1.size);// Determines size of the array 
//$display("%d",d[2]);
//$display("%d",d[4]);
//$display("%d",d[7]);
	$display("%p",d1);
//d.delete;// Destructor, Deallocates memory
//$display("Deleted size: %d", d.size);
//$display("%p",d);
end
endmodule
