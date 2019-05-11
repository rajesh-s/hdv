
class Receiver ;
Packet pkt;
Packet_fetch pkt_cmp;	

mailbox #(Packet)rec_sb;
mailbox #(Packet_fetch) rec_sb2;

virtual lc3_io.cg i;
virtual fetch_probe_if i2;

extern function new(mailbox #(Packet)rec_sb, mailbox #(Packet_fetch)rec_sb2, virtual lc3_io.cg i, virtual fetch_probe_if i2);
extern task start();
extern task start2();
extern task recv();
endclass

function Receiver::new(mailbox #(Packet)rec_sb, mailbox #(Packet_fetch)rec_sb2, virtual lc3_io.cg i, virtual fetch_probe_if i2);
this.rec_sb = rec_sb;
this.rec_sb2 = rec_sb2;
this.i = i;
this.i2 = i2;
endfunction

task Receiver::start();//call task recv() and put fetchpacket items to mailbox within fork join
fork
	//pkt = null;
	//pkt_cmp = null;

//Connecting interface from DUT to Monitor
	recv();
	pkt.Instr_dout = i.cb.Instr_dout;
	pkt.complete_instr = i.cb.complete_instr;		
	pkt.Data_dout = i.cb.Data_dout;
	pkt.complete_data = i.cb.complete_data;	
	pkt.pc=i.cb.pc;
	pkt.D_macc=i.cb.D_macc;
	pkt.I_macc=i.cb.I_macc;
	pkt.Data_addr=i.cb.Data_addr;
	pkt.instrmem_rd =i.cb.instrmem_rd;
	pkt.Data_rd=i.cb.Data_rd;
	pkt.Data_din=i.cb.Data_din; 
	pkt.reset<=i.reset;
	@(i.cb);
join
endtask

task Receiver::start2();
fork
// USe blocking statements when RHSis interface
	recv();	
	pkt_cmp.reset = i2.reset;
	pkt_cmp.enable_updatePC = i2.cb2.enable_updatePC;
	pkt_cmp.enable_fetch = i2.cb2.enable_fetch;
        pkt_cmp.br_taken = i2.cb2.br_taken;
	pkt_cmp.taddr = i2.cb2.taddr;
	pkt_cmp.pc = i2.cb2.pc;
	pkt_cmp.npc_out = i2.cb2.npc_out;
	pkt_cmp.instrmem_rd = i2.cb2.instrmem_rd;
	@(i2.cb2);

	
join		
endtask

task Receiver::recv(); // Putting monitor contents to the mailbox that connects Monitor to SB
begin
	pkt = new();
	pkt_cmp = new();
	//rec_sb.put(pkt);
	rec_sb2.put(pkt_cmp);
end
endtask
