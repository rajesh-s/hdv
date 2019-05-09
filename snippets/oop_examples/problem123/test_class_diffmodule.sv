`include "test_class.sv"
module test_class_diffmodule;
initial
begin
	test f1; // Handle - A pointer to that class. Like an address. Treated as a pointer variable (Safe pointer)
	f1 = new(); // Object creation. Different from new[] used for dynamic array
	// new() constructor. Allocates memory only when this constructor is used. Also, called the default constructor
	f1.i = 10; // Need object to be created using new operator before this operation
	f1.j = 20; // Accessing member variables through object 
	f1.disp();// Function/ Task call
	// Pass by value
	$display("%p",f1);
end
endmodule
