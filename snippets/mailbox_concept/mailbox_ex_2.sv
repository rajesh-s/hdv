// Packet class 
class rand_packet;
rand bit [3:0] a;
rand bit [7:0] b;
endclass

// Generator
class generator;
bit success;
rand_packet inst = new();// Creating and allocating memory for class property via an object inst
mailbox mb_gen_drv = new();
task run();
repeat(5)
begin
success = inst.randomize();
mb_gen_drv.put(inst);
$display($time," : Putting a = %0d and b = %0d into mailbox",inst.a,inst.b);
#5;
end
endtask
endclass

// Driver
class driver;
rand_packet inst; // Do not use new keyword again as we do not need to create another instance 
//but only bind the instance of the generator with the driver
mailbox mb_gen_drv; // Single mailbox no need = new();// Creating another mailbox for get with a different name. 2nd mailbox
task run();
 //#25; Delay to get once all values after they have put for all 
//$display("Size of the driver mailbox is %0d",mb_gen_drv.num);// Function to disp size of mailbox
repeat(5)
begin
mb_gen_drv.get(inst);
$display($time," : Getting the values from mailbox a = %0d , b = %0d",inst.a,inst.b);
#5;
end
endtask
endclass

// Main Module
module mailbox_ex_2;
generator gen = new();
driver drv = new();
// Module execution starts 
initial
begin
drv.mb_gen_drv = gen.mb_gen_drv;// Connecting generator and driver mailboxes together 
fork // Used to run concurrently both the driver and generator classes
gen.run();
drv.run();
join
$finish();
end
endmodule