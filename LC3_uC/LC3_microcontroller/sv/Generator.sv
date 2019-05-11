class Generator;
string  name;
Packet pkt; //Creating a Packet object for Top Level DUT Packet. No need to mention Packet within the string
mailbox #(Packet) gen_drv; //Mailbox creation between generator and driver with mailbox handle gen_drv
	
//int packet_number; Unused variables
//int number_packets; Unused variables

// Generator class Tasks and Functions
extern function new(mailbox #(Packet)gen_drv); // Non Default constructor for generator class
extern task start();
extern task gen();
endclass


function Generator::new(mailbox #(Packet)gen_drv);
this.gen_drv=gen_drv;
endfunction

task Generator::gen();// Class based randomization task randomizes based on constraints in Packet class
pkt = new();
if(pkt.randomize())
	start(); // Initiate putting the randomized packets into mailbox
else	
	$display("Randomization failed");
endtask

task Generator::start()	;// Putting the constrained random packets into the mailbox
gen_drv.put(pkt);
endtask

/*
The this keyword is used to unambiguously refer to class properties or methods of the current instance. The
this keyword denotes a predefined object handle that refers to the object that was used to invoke the subrou-
tine that this is used within.
*/

