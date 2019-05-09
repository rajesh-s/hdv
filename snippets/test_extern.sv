class base;
exterm task print(); 
endtask
// Without exten keyword it expects definition of function within the class
// Functions and Tasks are static by default - Single storage
// Static makes lifetime global but scope is within the block;
endclass

task base::print();// Defining task outside the scope
$display("SV for verifn");
endtask

module test_extern;
initial
begin
base b;
b = new();
b.print();
end
endmodule
