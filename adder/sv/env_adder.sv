module env_adder(input [2:0]a,b,output reg [2:0]s,output reg c);
always@(a,b)
begin
$display("inside DUT");
{c,s}=a+b;
end
endmodule
