class test;
int i,j; // Data member / Properties
task disp();// Member function 
	$display("%d,%d",i,j);
endtask
endclass

module test_class;
/* This is also allowed:
module test_class;
initial
begin
	test f1; // Handle - A pointer to that class. Like an address. Treated as a pointer variable (Safe pointer)
	f1 = new(); // Object creation. Different from new[] used for dynamic array
	// new() constructor. Allocates memory only when this constructor is used. Also, called the default constructor
	f1.i = 10;
	f1.j = 20; // Accessing member variables through object 
	f1.disp();// Function/ Task call
end
endmodule*/
initial
begin
	test f1; // Handle - A pointer to that class. Like an address. Treated as a pointer variable (Safe pointer)
        f1 = new(); // Object creation. Different from new[] used for dynamic array
	// new() constructor. Allocates memory only when this constructor is used. Also, called the default constructor
	f1.i = 10;
	f1.j = 20; // Accessing member variables through object 
	f1.disp();// Function/ Task call
end
endmodule
