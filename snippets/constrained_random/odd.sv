module odd;
integer a;
initial
begin
repeat(10)
begin
	a = $urandom_range(1,100);
	if(~(a%2==0))
		$display("%d",a);
end
end
endmodule
