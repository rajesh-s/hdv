module first;

bit [31:0][4:0] one_pack;
//One dimensional 32 bit packed array containing 5 elements

int one_unpack [4:0];
// or using bit itsrelf
initial
begin
for(int i=0;i<5;i++)
	one_pack[i] = i;

for (int j=0;j<5;j++)
	begin
	one_unpack[j] = one_pack[j];
	$display("one_pack[%0d] = %0d and one_unpack[%0d] = %0d",j,one_pack[j],j,one_unpack[j]);
	end
end
endmodule
