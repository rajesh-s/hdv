`include "env_adder_package.sv" // Package containing the header files 
`include "env_adder_intf.sv"
module env_adder_top
import pack :: *; // Call only by the package name
intf i();
env_adder aa(.a(i.a),.b(i.b),.c(i.c),.s(i.s));
env_adder_test t(i);
endmodule
