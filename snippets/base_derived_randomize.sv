//Derived class based randomization

class base_randomize;
rand int a;
constraint c1{a>10;}
//constraint c1{a<100;a>0;}
endclass

class derived_randomize extends base_randomize;
constraint c2{a<10;}// Balancing of constraint conditions will happen when they have different names.
endclass

module base_derived_randomize;
initial
begin
	derived_randomize d1;
	d1 = new();
	for(int i =0; i<100; i++)
	begin
		if(d1.randomize())
			$display("Randomization successful %d",d1.a);
		else
			$display("Randomizationfailed");
	end
end
endmodule
/*
Property overriding
When the base and derived have the same constraint names- 51 - 99 balance all constraints
Even when constraint in derived class is made to have the same name the above output remains
When a<100 is removed in derived class and a different name then the range is preserved, because the constraints on variable a need to be balanced
When a>50 is there with the same name, it overrides base class constraints- Overriding property*/