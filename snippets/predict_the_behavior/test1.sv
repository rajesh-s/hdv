module test1;
int d[5] = '{1,2,3,4,5};// Static cannot be deleted
int d1[];// No size , new , delete operators for static 
initial
begin
	d1 = new[4294967295];// Max 32 bit signed number	
	$display("%d",d1.size);
	//d1[2] = 8;
	//foreach(d[i])
	//	d[i] = 0;
	//d1 = d; // Dynamic array can be directly copied from static
	
	$display("%d",d1.size);
	$display("%p",d1);
end
endmodule
