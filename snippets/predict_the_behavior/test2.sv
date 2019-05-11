module test2;
reg [7:0] a,b,c,d;

initial 
begin
c=9;d=0;b=3;
for(a=b;c;d=a)
begin
a = b+c;
c = c-b;
end   
$display("%d %d %d %d",a,b,c,d);
end
endmodule
