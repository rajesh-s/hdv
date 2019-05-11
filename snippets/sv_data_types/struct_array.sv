module struct_array;
struct
{
	reg[7:0] a;
	logic[3:0] b;
	shortint c;
}a1[0:1] = '{'{40,3,70},'{35,3,15}};
initial
begin
	$display("%d",a1[0].a);
	//$display("%d",a1[1].a);
	//$display("%d",a1[1].b);
	//$display("%d",a1[0].b);
	//$display("%d",a1[0].c);
	//$display("%d",a1[1].c);
	foreach(a1[i])
	if(i==0)
	$display( "%d %d %d",a1[i].a,a1[i].b,a1[i].c);
end
endmodule

	