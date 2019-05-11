module Fetch( clock, reset, enable_updatePC, enable_fetch, pc,
              npc_out, instrmem_rd, taddr, br_taken);

input clock,reset,br_taken,enable_fetch, enable_updatePC;
input [15:0] taddr;
output [15:0] pc, npc_out; // Output npc is same as npc_out
output instrmem_rd;
reg [15:0] ipc; // Intermediate Program counter
wire [15:0] muxout;
wire [15:0] npc_int; // Intermediate next Program Counter

always@(posedge clock)
if(reset==1)
	begin
		ipc <= 16'h3000;
		// ipc<= 16'h3001; Error
		//ipc <= 16'h3005; Error
	end
else
	begin
		if(enable_updatePC)
			ipc <= muxout;
		else
			ipc <= ipc;
	end

assign muxout = (br_taken) ? taddr : npc_int; 

assign npc_int = ipc + 1'b1; // NPC update asynchronously
//assign npc_int = ipc + 2; Error

assign npc_out = npc_int;
//assign npc_out = npc_int + 2; Error

assign pc = ipc;

assign instrmem_rd = (enable_fetch)?1'b1 : 1'bz;
//assign instrmem_rd = (enable_fetch)?1'b0 : 1'b0; Error

endmodule

