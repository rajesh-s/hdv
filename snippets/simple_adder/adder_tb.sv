module adder_tb;
logic [15:0] a,b;
logic [16:0] sum;
adder a1(.*); // Adder Instantiation
initial
	begin
		repeat(10)
			begin
				a = $urandom_range(5,25);
				b = $urandom_range(7,50);
				#10;
			end
	end
initial $monitor($time,"a %d and b %d is sum %d",a,b,sum);
endmodule 