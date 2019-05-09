module test_implication_operator_conditional_constraints;

class implicationclass;
rand bit a;
rand bit [31:0] b; // To impose simultaneous constraints on b  with implication use a 2 state data type
constraint c1 { 
		a -> b inside {2,4,6,8};
		b < 10;}
// constraint c1 b inside [] would not generate any value outside that range
// but impication operator generates even values outside this range. Since the constraint
// is NOT begin imposed on b, but implication being imposed on a
endclass

implicationclass i;
initial
begin
	i = new();
	repeat(10)
		begin
			i.randomize();
		        $display(" a = %b b = %0d",i.a,i.b);
		end
end
endmodule

