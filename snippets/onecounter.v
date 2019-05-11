module onecounter(output reg [2:0] out,input [4:0] in);
integer i,counter=0;
initial
begin
	for(i=0;i<5;i=i+1)
	begin
		if(in[i]==1'b1)
			counter = counter + 1;
	end
	out = counter;     
end
initial
$display("Ones in %b is %b",in,out);

endmodule
