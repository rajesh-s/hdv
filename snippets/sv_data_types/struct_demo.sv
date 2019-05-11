module struct_demo;
struct // Use packed to make it contiguos and allow part select. Also, vars can only be integral
{
	reg [7:0] a;
	bit [3:0] b;
	shortint c;
} a1,a2;

struct packed
{
	int a;
	shortint b;
} a3 = '{32,12};
//a2 = '{reg:45,shortint:75,bit:3};

initial
begin
	a1.a = 50;
	a1.b = 4'b0101;
	a1.c = 75;
$display("a1.a = %d , a1.b = %b , a1.c = %d %b %p ",a1.a,a1.b,a1.c,a3[47:0],a2);
// Size of struct is the sum of
//size of variables
end
endmodule
