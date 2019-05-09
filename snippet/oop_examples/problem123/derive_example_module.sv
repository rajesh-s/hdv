//`include "base_class.sv"
`include "derived_class.sv"
module derive_example_module;
initial
begin
// Calling the function present in the derived class
	derived d1;// Handle
	d1 = new();// Object
	d1.printf();

// An object of derived class can access functions of base class but not vice versa
//  case 2 - Checking if an object of the base class can access a function of the derived class
// This is not allowed.
//	base b1;
//	b1 = new();
//	b1.printf();
// One dervied class object cant access another derived class object 

end
endmodule
