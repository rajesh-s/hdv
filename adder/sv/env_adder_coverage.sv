class coverage;
virtual intf i;
covergroup cg @(i.a,i.b);
	A: coverpoint i.a{bins a_bin = {[5:7]};}
	B: coverpoint i.b;
	S: coverpoint i.s{bins s1 = {0,1};bins s2 = {2,3};}
// Can have multiple sets under the cover points
// Coverpoints are written with constraints to test
// specific features unlike a packet class constrained to test
// all features
	D: coverpoint i.c;
endgroup	
function new (virtual intf i);
	this.i = i ;
	cg = new;
endfunction
task sample();
	cg.sample();
// Include all covered group samples here!
endtask
endclass

