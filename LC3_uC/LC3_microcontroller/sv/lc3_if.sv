interface lc3_io(input bit clock); 
// Interface for the top level LC3 controller, clock is not included within the interface as it is not a common signal between Driver and DUT
  	
//Declare all signals at the top level without specifying direction
logic reset,complete_instr,complete_data;
logic  [15:0] Instr_dout,Data_dout;
logic [15:0]   pc, Data_addr, Data_din;
logic instrmem_rd, D_macc, I_macc, Data_rd;

//Clocking block to eliminate race condition(skew) between DUT and TB
clocking cb@(posedge clock);
default input #1 output #1;
input  pc,D_macc, I_macc, Data_addr, Data_din, Data_rd, instrmem_rd; // Reset signal is excluded in this block and mentioned under modport
inout Instr_dout, Data_dout, complete_instr, complete_data;
endclocking

//Declaring modport for driver and monitor outputs/inputs
modport drv(output Instr_dout, Data_dout, complete_instr, complete_data);
modport rec(input pc,D_macc, I_macc, Data_addr, Data_din, Data_rd, instrmem_rd);
modport cg(clocking cb,output reset); 
endinterface

// Fetch interface to wire out Fetch block signals ONLY from the DUT for FETCH DUV 
interface fetch_probe_if(	
	input bit clock,
        input bit reset,
	input logic br_taken, 
	input logic enable_fetch, 
	input logic enable_updatePC,
	input logic [15:0] taddr,
	inout logic [15:0] pc,
        inout logic [15:0]  npc_out,
        inout logic instrmem_rd
	);
	
clocking cb2@(posedge clock);
default input #1 output #1;		
input	br_taken; 
input	enable_fetch; 
input	enable_updatePC;
input 	taddr;
//input reset;
inout pc;
inout npc_out;
inout instrmem_rd;
endclocking
//modport fetch_cg(clocking cb2, output reset); 
endinterface/*
DUT outputs are monitor inputs. Inputs must be driven just before clock edge and outputs sampled just after clock edge. Introduces a DUT Delay + 1 time unit delay to extend execution to a different region, thereby acting as a synchronizer.
*/ 
