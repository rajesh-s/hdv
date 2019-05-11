module Writeback(	
clock, reset, enable_writeback, W_Control, aluout, memout, pcout, npc, 
sr1, sr2, dr, d1, d2, psr 
);
  	
input   clock, reset, enable_writeback;
input   [15:0] aluout, memout, pcout, npc;
input   [1:0]  W_Control;
input 	[2:0]  sr1, sr2, dr;     	
output	[2:0]  psr;
output 	[15:0] 	d1, d2;				
reg 	[15:0] 	DR_in;      	
reg	[2:0]	psr;

  	
RegFile RF (	
	.clock(clock), 
	.sr1(sr1), 
	.sr2(sr2), 
  	.din(DR_in), 	
	.dr(dr), 
	.wr(enable_writeback),
  	.d1(d1), 
	.d2(d2) );
  	
`protect
   	always@(W_Control or aluout or memout or pcout) //or npc) Error
  	begin
		case(W_Control)
			0: DR_in<=aluout;
	  		1: DR_in<=memout;	
	  		2: DR_in<=pcout;
			//2: DR_in<=aluout; Error
	  		//0: DR_in<=aluout; Error
 		
          	3: DR_in<=npc;
        endcase      	
  	end
 	
  	always @(posedge clock)
  	begin
       	if (reset)
       		begin
       			psr <= 0;
       		end
       	if (enable_writeback)
       		begin
		      	if(DR_in[15])    
				psr <= 3'h4;
				//psr <= 3'h6; Error	
	      		else if((|DR_in)) 
				psr <= 3'h1;
	      		else              
	        		psr <= 3'h2;
	 	end       	
    end    	
`endprotect
endmodule


module RegFile(clock, wr, sr1, sr2, din, dr, d1, d2); 

  	input 	clock, wr;
  	input 	[2:0] 	sr1, sr2, dr;     	
  	input 	[15:0] 	din;             	
  	output 	[15:0] 	d1, d2;				

  	reg 	[15:0] 	ram [0:7] ;
  	wire 	[15:0] 	R0,R1,R2,R3,R4,R5,R6,R7;

`protect
   	wire	[2:0]	addr1, addr2;
   	wire	[15:0]	data1, data2;
   	
   	assign	addr1 = sr1;
	//assign	addr1 = {1'b1, sr1[1:0]}; Error
   	assign	addr2 = sr2;
   	assign	data1 = ram[addr1];
   	assign	data2 = ram[addr2];
  	assign 	d1 = data1;
  	assign 	d2 = data2;
   
 	always @(posedge clock)
   		begin
       			if (wr)
				ram[dr]<= din;	 
				//ram[dr]<= {din[0], din[14:1], din[15]}; Error	 
		end

`endprotect
  
  	assign 	R0	=	ram[0];
  	assign 	R1	=	ram[1];  
  	assign 	R2	=	ram[2];
  	assign 	R3	=	ram[3];  
  	assign 	R4	=	ram[4];
  	assign 	R5	=	ram[5];  
  	assign 	R6	=	ram[6];
  	assign 	R7	=	ram[7];
  
endmodule

