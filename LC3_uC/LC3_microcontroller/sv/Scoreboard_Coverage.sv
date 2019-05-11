class Scoreboard;
			
Packet pkt_sent = new();	        // Packet object from Driver
Packet_fetch   pkt_cmp = new();	    // Packet object from Receiver
  	
mailbox #(Packet) drv_sb;	        // mailbox for Packet objects from Drivers

//mailbox #(Packet) rec_sb;           // mailbox for Fetch Packet objects from Receiver
mailbox #(Packet_fetch) rec_sb2;    // mailbox for DUT Packet objects from Receiver

	
reg	br_taken_chk;
reg	enable_fetch_chk;
reg	enable_updatePC_chk;
reg	[15:0] 	taddr_chk; 
reg	[15:0]	pc_chk;
reg	[15:0]	npc_out_chk;
reg	instrmem_rd_chk;	
	
	
extern function new(mailbox #(Packet)drv_sb, mailbox #(Packet_fetch) rec_sb2);//mailbox #(Packet) rec_sb,
//string name = "Scoreboard", out_box_type driver_mbox = null, rx_box_type receiver_mbox = null);
extern virtual task start();
extern virtual task check();
extern virtual task check_fetch();

//Coverage Class 
real coverage_value1, coverage_value2; 

covergroup lc3_cov; 
	complete_instr: coverpoint pkt_sent.complete_instr{bins complete_instr={0,1};}
	complete_data:  coverpoint pkt_sent.complete_data{bins complete_data={0,1};}
	Instr_dout: coverpoint pkt_sent.Instr_dout{bins Instr_dout={16'h1422,16'h5020,16'hEDFE,16'h1280,16'h903F};}//[16'h3000:16'h3003]
	Data_dout: coverpoint pkt_sent.Data_dout{bins Data_dout={[16'h3006:16'h3011]};}
endgroup
          
// COVERAGE FETCH
covergroup lc3_fetch_cov; 
	br_taken: coverpoint pkt_cmp.br_taken{bins br_taken={0,1};}
	enable_fetch: coverpoint pkt_cmp.enable_fetch{bins enable_fetch={0,1};}
	enable_updatePC: coverpoint pkt_cmp.enable_updatePC{bins enable_updatePC={0,1};}
	pc: coverpoint pkt_cmp.pc{bins pc={[16'h3000:16'h300d]};}
	npc_out: coverpoint pkt_cmp.npc_out{bins npc={[16'h3000:16'h300d]};}
	instrmem_rd: coverpoint pkt_cmp.instrmem_rd{bins instrmem_rd={0,1};}
endgroup
	 
endclass

function Scoreboard::new (mailbox #(Packet)drv_sb, mailbox #(Packet_fetch) rec_sb2);//, mailbox #(Packet) rec_sb
//new(string name = "Scoreboard", out_box_type driver_mbox = null, rx_box_type receiver_mbox = null);
//this.name = name;
//if (driver_mbox == null) 
//driver_mbox = new();
//if (receiver_mbox == null) 
//receiver_mbox = new();
//this.driver_mbox = driver_mbox;
//this.receiver_mbox = receiver_mbox;
	drv_sb = new();
//	rec_sb = new();
	rec_sb2 = new();
	
	this.drv_sb = drv_sb;
//	this.rec_sb = rec_sb;
	this.rec_sb2 = rec_sb2;

//Coverage Class	
// COVERAGE
       
	lc3_cov=new();
	lc3_fetch_cov=new();

endfunction

task Scoreboard::start();

$display ($time, "ns:  [SCOREBOARD] Scoreboard Started");
pc_chk=16'h3000;
npc_out_chk = pc_chk+1;
br_taken_chk = 0;
enable_fetch_chk = 0;
enable_updatePC_chk = 0;
taddr_chk = 0;
	
$display ($time, "ns:  [SCOREBOARD] Receiver Mailbox from DUT contents = %d", rec_sb2.num());
	
fork
	forever 
		begin		
			while (rec_sb2.num()) begin
				$display ($time, "ns:  [SCOREBOARD] Grabbing Data From both Driver and Receiver");
				rec_sb2.get(pkt_cmp); 
				drv_sb.get(pkt_sent);
				check();
			end
		end
	join_none
	$display ($time, "[SCOREBOARD] Forking of Process Finished");
endtask

task Scoreboard::check();
	
   check_fetch();
	
//Coverage class	
    lc3_cov.sample();
    lc3_fetch_cov.sample();
        	
	coverage_value1 =        lc3_cov.get_coverage();
    coverage_value2 =        lc3_fetch_cov.get_coverage();

    $display ($time, "  [SCOREBOARD -> COVERAGE] Coverage Result for cover 1 At present = %d", coverage_value1);
    $display ($time, "  [SCOREBOARD -> COVERAGE] Coverage Result for cover 2 At present = %d", coverage_value2);

endtask
	
task Scoreboard::check_fetch();
	
    if(pkt_reset)
	pc = 16'h30000;
    else
	begin
	
    	if(pkt_cmp.enable_updatePC) 
        	     begin   
        	        if(pkt_cmp.br_taken)
        	                pc_chk = pkt_cmp.taddr;
        	         else
        	                pc_chk = npc_out_chk; 
        	         end
	else
	pc_chk = pc_chk;      
	end
        npc_out_chk = pc_chk + 1;

      if(pkt_cmp.enable_fetch)
         instrmem_rd_chk = 1'b1;
      else
         instrmem_rd_chk = 1'bz;            

    assert(pkt_cmp.pc == pc_chk) 
     else
   $error($time,"ns:\n*********** <CHECKER PC> ERROR in PC**************\n");
    
     assert(pkt_cmp.npc_out == npc_out_chk) 
     else
   $error($time,"ns:\n*********** <CHECKER NPC> ERROR in NPC**************\n");

      assert(pkt_cmp.instrmem_rd == instrmem_rd_chk) 
     else
   $error($time,"ns:\n*********** <CHECKER instrmem> ERROR in instrmem_rd**************\n");
            
endtask	


