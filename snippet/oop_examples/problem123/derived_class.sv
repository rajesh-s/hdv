`include "base_class.sv"
class derived extends base;
int i = 4;
task printf();// if this had same name as base class it would be function overriding
begin
	$display("%d %d",i,j);
end
endtask
endclass
