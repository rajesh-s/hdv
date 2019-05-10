module test;
int i =3 ;
initial
begin
	while(i--)
	begin
		int i = 101;
		i--;
		$display("%d",i);
	end
end
endmodule 