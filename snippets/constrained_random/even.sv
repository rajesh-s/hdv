module even;
integer a;
initial
begin
repeat(10)
begin
	a = $urandom_range(0,102);
	if((a%2)==0)
		$display("%d",a);
end
end
endmodule

