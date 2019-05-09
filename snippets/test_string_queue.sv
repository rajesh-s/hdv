module test_string_queue;
string street[$];
initial
begin
street = {"Tejon","Bijou","Boulder"};
$display("Street[0] = %s",street[0]);
street.insert(2,"Platte");
$display("Street[2] = %s", street[2]);
street.push_front("St.Vrain");
$display("Street[2] = %s",street[2]);
$display("pop_back = %s",street.pop_back);
$display("Street size = %d",street.size);
end
endmodule
