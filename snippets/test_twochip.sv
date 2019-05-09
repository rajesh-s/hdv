module test_twochip;
int k;
initial
begin
for(int j =0; j<3; j++)
fork
begin
k = j;
$display(k);
end
join_none
end
endmodule
