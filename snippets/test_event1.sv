module test_event1;
event e1,e2;
initial
begin
$display("1 before trigger",$time);
->e1;
@e2;
#1 $display("1 after trigger",$time);
end
initial
begin
$display("2 before trigger ",$time);
->e2;
$display("2 after trigger ",$time);
end
endmodule
