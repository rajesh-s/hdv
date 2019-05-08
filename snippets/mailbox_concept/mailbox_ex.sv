// Packet class 
class rand_packet;
rand bit a;
rand bit b;
endclass

// Generator
class generator;
bit success;
rand_packet inst;// Creating and allocating memory for class property via an object inst
mailbox mb_gen = new();// For concurrent put,get new() can be in the above line itself
task run();
repeat(5)
begin
inst = new(); // For receiving after everything has been sent. Kind of makes it automatic 
success = inst.randomize();
mb_gen.put(inst);
$display($time," : Putting a = %0d and b = %0d into mailbox",inst.a,inst.b);
#5;
end
endtask
endclass

// Driver
class driver;
rand_packet inst; // Do not use new keyword again as we do not need to create another instance 
//but only bind the instance of the generator with the driver
mailbox mb_drv;// = new();// Creating another mailbox for get with a different name. 2nd mailbox
task run();// The above new keyword gets allocated implicitly at line 49 when connecting 
 #25; //Delay to get once all values after they have put for all
$display("Size of the driver mailbox is %0d",mb_drv.num);// Function to disp size of mailbox
repeat(5)
begin
#5;
mb_drv.get(inst);
$display($time," : Getting the values from mailbox a = %0d , b = %0d",inst.a,inst.b);
#5;
end
endtask
endclass

// Main Module
module mailbox_ex;
generator gen = new();
driver drv = new();
// Module execution starts 
initial
begin
drv.mb_drv = gen.mb_gen;// Connecting generator and driver mailboxes together 
fork // Used to run concurrently both the driver and generator 
gen.run();
drv.run();
join
$finish();
end
endmodule
