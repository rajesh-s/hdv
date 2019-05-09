module test_static_extern;

class  static_extern;
int z = 1;
task disp();
$display("%d",z);
endtask
endclass

class static_extern_2 extends static_extern;
task disp();
z++; $display("%d",z);
endtask
endclass

class static_extern_3 extends static_extern;
task disp();
z++; $display("%d",z);
endtask
endclass
// Lifetime & Scope of local is within the block
// Lifetime is for entire program but scope is limited to the block for static
initial
begin
	static_extern s1;
	static_extern_2 s2;
	s1 = new();
	s2 = new();
	s1.disp();
	s2.disp();
end
endmodule
