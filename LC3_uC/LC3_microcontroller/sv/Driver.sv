class Driver ;
Packet pkt ; // We do not need to create another instance of Packet hence new keyword is omitted
mailbox #(Packet)gen_drv;//Generator mailbox. Mailbox object created using non default constructor
mailbox #(Packet)drv_sb;// Scoreboard mailbox. Mailbox object created using non default constructor
virtual lc3_io.cg i;//interface Any change to be made because of cb? i.cb?

extern function new( mailbox  #(Packet)gen_drv,mailbox #(Packet)drv_sb,virtual lc3_io.cg i); // Non default constructor
extern task start();
extern task send();
endclass

function Driver::new(mailbox #(Packet) gen_drv,mailbox #(Packet) drv_sb,virtual lc3_io.cg i);
begin
	this.gen_drv=gen_drv;
	this.drv_sb=drv_sb;
	this.i=i;
end
endfunction

task Driver::start();
begin
	gen_drv.get(pkt); // Gets constrained random packets put from the generator mailbox
	drv_sb.put(pkt); // Putting received packet to scoreboard mailbox
	send(); // Call the send task that maps the Packet variables(members) to the interface members
end 	
endtask

task Driver::send();
begin
	i.cb.complete_instr <= pkt.complete_instr;
	i.cb.Instr_dout     <= pkt.Instr_dout ;
	i.cb.complete_data  <= pkt.complete_data;
	i.cb.Data_dout      <= pkt.Data_dout; // Use non blocking as we have event/clock edge based assignment
	@(i.cb);
end
endtask
