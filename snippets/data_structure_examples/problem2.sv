module problem2;
bit [11:0] my_array [0:3];

initial
begin
	my_array[0] = 12'h012;
	my_array[1] = 12'h345;
	my_array[2] = 12'h678;
	my_array[3] = 12'h9AB;

foreach(my_array[i])
	$display("Element 7:5 bits is %b", my_array[i][7:5]);

for(i=0;i<4;i++)
	$display("Element 7:5 bits is %b", my_array[i][7:5]);

end
endmodule
