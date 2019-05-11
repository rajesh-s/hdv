//Difference between struct and union
module unioneg;
union //packed
{
	int i;
	real r;
	//bit [7:0] a;
	//bit [7:0] b;
		// 16bit structure 8bit union
}a1;
// Structure allocates memory for all the member vars
// Union allocates memory only for the largest memory
// It is shared between the real and int var. The first print can retrieve the correct value
// but is no longer available once real is written
initial
	begin
		a1.r = 24444.500000001;//22222222222222222222222222222222222000000000000001111111111111111111111111111111001.45;
		
		//a1.a= 255;
		$display("a1.i = %d",a1.i);
		$display("a1.r = %d",a1.r);
		$display("a1 = %p",a1);
		//$display("a1 = %b",a1);
		// Memory will be wiped once a newly updated value is sent 
		a1.i = 500000001;
		//a1.b = 0;
		$display("a1 = %p",a1);
		$display("a1.i = %d",a1.i);
		$display("a1.r = %f",a1.r);
	end
endmodule
