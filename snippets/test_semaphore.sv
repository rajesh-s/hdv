module test_semaphore;
semaphore key;
initial
begin
key = new(1);
repeat(5)
fork
test;
join_none
end
task test;
key.get;
randomize(delay);
#delay key.put;
$display($time," now time is");
endtask
endmodule 