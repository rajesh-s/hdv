module test1;

reg a,b,c,d,e,f;

initial 
	begin
		a=1'b1;
	  #5	b=1'b0;
	end
initial
	begin
       	  #10	c=1'b1;
	  #25   d=1'b0;
	end
initial
	begin
	#20	e=1'b1;
	#5	f=1'b0;
	end
initial
	#50 $stop;
initial 
	$monitor($time,"ns: a = %b  b  = %b  c = %b  d = %b e = %b f = %b",a,b,c,d,e,f);
endmodule
