module qresize_wo_keyword;

int r[$],s[$];
int q[$] = {0,2,4,6,8};
initial
begin
r = q[1:$];
$display("Remove first %p",r);
s = q[0:$-1];
$display("Remove last %p",s);
end
endmodule
