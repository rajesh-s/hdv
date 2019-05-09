module unpack_to_pack;
reg a [3:0] = '{0,0,0,1};
reg [7:0] b;
reg [7:0] c = 4'bx111,d=4'b0111,e;
initial
begin
for(int i =0;i <8;i++)
b[i]=a[i];// Array initialization. Fills x if a is of smaller size than b
$display("Unpacked array = %p",a);
$display("COnverted Packed Array = %b c = %b  d = %b e = %b" ,b,c,d,e);
end 
endmodule
