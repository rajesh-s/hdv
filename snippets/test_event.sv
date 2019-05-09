module event_test;
event e1,e2;
initial
begin
$display(" 1 before trigger ", $time);
->e1;
wait(e2.triggered);
$display("1 after trigger ",$time);
end
initial
begin
$display("2 before trigger ",$time);
->e2;
wait(e1.triggered);
$display("2 after trigger ",$time);
end
endmodule