module test;
reg a,b,c,d;
initial
begin
a = 1;
#0 d = c;
end
initial
begin
b = 1;
c = 0;
end
endmodule
