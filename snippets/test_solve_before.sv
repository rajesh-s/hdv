module test_solve_before;
class B;
rand bit s;
rand bit [31:0] d;
constraint c { s -> d ==0;}
//constraint c1 {solve s before d;}
constraint c1 {solve d before s;} // Chance of s becoming 1 is minimal because d becoming 0 on randomize is rare
endclass

B b = new;
initial
begin
repeat(10)
begin
b.randomize();
$display("%p",b);
end
end
endmodule
