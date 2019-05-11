`include "Packet.sv"
`include "Packet_fetch.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "lc3_if.sv"
`include "LC3.sv"
`include "Receiver.sv"
`include "Scoreboard.sv"
`include "Environment.sv"
`include "lc3_test.sv"

module Toptb();
reg clock,reset;//declare clock and reset as reg
 initial
   begin
   	clock = 1'b0;//initialise clock to zero
   	reset = 1'b1;//generate reset
     //#10 reset = 1'b0;
     //#200 reset = 1'b1;//$finish;------add when required...already program block is present
   end
always		
	#5	clock <= ~clock;  //generate clock in always

// Always conenct to global clock
//instantiate  toplevel lc3 interface
lc3_io top_io(clock);

//instantiate  Fetch interface	
fetch_probe_if fetch_probe( .clock(clock),
			    .reset(reset),
			    .br_taken(DUT.Fetch.br_taken),
			    .enable_updatePC(DUT.Fetch.enable_updatePC),
	   		    .enable_fetch(DUT.Fetch.enable_fetch),
	                    .pc(DUT.Fetch.pc),
	                    .npc_out(DUT.Fetch.npc_out),
	                    .instrmem_rd(DUT.Fetch.instrmem_rd),
	                    .taddr(DUT.Fetch.taddr));

//instantiate  lc3_test
lc3_test test1 (top_io.cg, fetch_probe);

//instantiate  LC3
LC3 DUT        (.clock(clock),
		.reset(reset),
		.pc(top_io.pc),
		.instrmem_rd(top_io.instrmem_rd),
		.Instr_dout(top_io.Instr_dout),
		.Data_addr(top_io.Data_addr),
		.complete_instr(top_io.complete_instr),
		.complete_data(top_io.complete_data),
		.Data_din(top_io.Data_din),
		.Data_dout(top_io.Data_dout),
		.Data_rd(top_io.Data_rd),
		.D_macc(top_io.D_macc),
		.I_macc(top_io.I_macc)); 

//instantiate  Fetch
Fetch Fetch  (.clock(clock),
	       .reset(reset),
	       .enable_updatePC(fetch_probe.enable_updatePC),
	       .enable_fetch(fetch_probe.enable_fetch),
	       .pc(fetch_probe.pc),
	       .npc_out(fetch_probe.npc_out),
	       .instrmem_rd(fetch_probe.instrmem_rd),
	       .taddr(fetch_probe.taddr),
	       .br_taken(fetch_probe.br_taken));
endmodule
