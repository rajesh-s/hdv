module swap;
integer a = 50, b = 20;
initial
begin
	a <= a ^ b ;
	b <= a ^ b;// When we use non blocking here it takes the value of a before xor which is not desired. Hence use blocking statements!
	a <= a ^ b;
end
initial 
$monitor("a = %d  b = %d",a,b);
endmodule
