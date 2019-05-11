module assc_array;// Associative array aka Sparse array
int mem[*];
//int d[];
initial
begin
	mem[20] = 80;
	mem[55] = 100;
	mem[127]= 125; // Assc arrays are implemented as sparse locations using LUT's. The space isn't blocked
	mem[55] = 124;
	//mem.delete(55);
	mem.delete(99);// Does not throw any error
	$display("%p",mem);
	$display("%d",mem.num); // Similar to array.size. num used for assc
	$display("%d", mem[127]);
	$display("%d",mem[15]);//assc_array.sv(11): Non-existent associative array entry. Returning default value
	 // Associative is non contiguos 
 	//d = mem is not allowed as non assc (contiguos) can't be assigned to associative
end
endmodule
