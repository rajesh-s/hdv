module array_locator_methods;
int d[] = '{7,1,8,3,4,4}, tq[$];
initial
begin

tq= d.find with (item>3);
$display("%p",tq);

tq = d.find_index with (item>3);
$display("%p",tq);

tq = d.find_first with (item>7);
$display("%p",tq);

tq = d.find_first_index with(item ==7 );
$display("%p",tq);

tq = d.find_last with(item ==48 | item ==7 );// Conditional expressions can be included on item 
$display("%p",tq);

tq = d.find_last_index with (item ==3);
$display("%p",tq);
end
endmodule
