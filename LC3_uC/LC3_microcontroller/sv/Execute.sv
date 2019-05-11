module Execute(	
clock, reset, E_Control, IR, npc, W_Control_in, Mem_Control_in, 
VSR1, VSR2, enable_execute,  W_Control_out, Mem_Control_out, 
NZP, aluout, pcout, sr1, sr2, dr, M_Data
); 	

input clock, reset, enable_execute;
input [5:0] E_Control;
input [1:0] W_Control_in;													
input [15:0] IR;
input Mem_Control_in;
input [15:0] npc;
input [15:0] VSR1, VSR2;// Asynchronously read from the register 

output [15:0] aluout, pcout;
output [1:0] W_Control_out;
output Mem_Control_out;
output [2:0] NZP;
output [2:0] sr1, sr2, dr;
output [15:0] M_Data;
reg [2:0] sr1, sr2, dr;
reg [1:0] W_Control_out;
reg Mem_Control_out;
reg [15:0] M_Data;
reg [15:0] pcout;

// Intermediate declaration 
wire [15:0] offset11, offset9, offset6, imm5, trapvect8;
wire [1:0] pcselect1, alu_control, alu_control_temp;
wire pcselect2, op2select;
reg  [15:0] addrin1, addrin2, aluin1_temp, aluin2_temp;
wire alucarry; 		
wire [15:0] VSR1_int, VSR2_int;
wire alu_or_pc; 
wire [15:0] aluin1, aluin2;

reg [2:0] NZP;
   
ALU alu	(clock, reset, aluin1, aluin2, alu_control, enable_execute, aluout, alucarry);
extension ext (IR, offset11, offset9, offset6, trapvect8, imm5); 

`protect
   always @ (posedge clock)
     begin
	if(reset) 
		NZP = 3'b001;
	else if(enable_execute)
		begin
	   		if(IR[13:12] == 00)
	     			begin
					if(IR[15:14] == 2'b00) 	
		   				NZP = IR[11:9]; 
					else if(IR[15:14] == 2'b11) 
		   				NZP = 3'b111;		
					else
						NZP = 3'b000;
	     			end
	   		else 
	      			NZP = 3'b000; 
		end
	else
		NZP = 3'b000;
     end
   
   

   always @(IR) 
     begin
       	case(IR[13:12])// Equivalent to opcode
	  2'b00: begin        
	       		sr1 <= IR[8:6];
	       		sr2 <= 3'd0; 
	    	 end	
	  2'b01: begin 
	       		sr1 <= IR[8:6];
	       		sr2 <= IR[2:0];
		   	//sr2 <= IR[3:1]; Error   
	    	 end
	  2'b10: begin 
	       		sr1 <= IR[8:6];  
	       		sr2 <= 3'd0; 
		   	//sr2 <= 3'd1; Error	   
	    	 end
	  2'b11: begin 
	       		sr1 <= IR[8:6];    
	       		sr2 <= IR[11:9];  
	    	 end
	endcase 
     end
   
   always @(posedge clock) 
       begin
 	  if(reset)
 	       dr <= 0;
 	  else if (enable_execute)
 	    begin
	       case(IR[13:12])
		 2'b00: begin  
		      		dr <= 3'd0; 
		   	end	
		 2'b01: begin 
				dr <= IR[11:9];
		  		//dr <= IR[10:8]; Error
			end
		 2'b10: begin 
		   		dr <= IR[11:9];
			     	//dr <= IR[12:10]; Error
			end
		 2'b11: begin 
		      		dr <= 3'd0;        
		   	end
	       endcase  		
 	    end
       end

   
   always @ (posedge clock)
   	begin
		if(reset)
		  	begin
			     	W_Control_out <= 0;
			     	Mem_Control_out <= 0;
			     	//M_Data <= 0;  // Ignore for this project
		  	end
		else if (enable_execute)// else if (1)
	  		begin
	     			W_Control_out <= W_Control_in;
	     			Mem_Control_out <= Mem_Control_in;
	       			//M_Data	<= VSR2_int; // Ignore for this project
	  		end	  		 
     	end
   
   assign {alu_control_temp, pcselect1, pcselect2, op2select}=E_Control;
   //assign {alu_control_temp, pcselect2, pcselect1, op2select}=E_Control; Error
   assign alu_or_pc = 1'b1;   	
   assign VSR1_int = VSR1;
   assign VSR2_int = VSR2;
   
   always @(VSR1_int)
     aluin1_temp <= VSR1_int;

   always @(op2select or VSR2_int or imm5)
     begin
  	if(op2select)
       	  aluin2_temp <= VSR2_int;
    	else
 	  aluin2_temp <= imm5;
     end
   
   assign aluin1 = alu_or_pc ? aluin1_temp : addrin1;
   assign aluin2 = alu_or_pc ? aluin2_temp : addrin2;
   assign alu_control = alu_or_pc ? alu_control_temp : 2'b0; 

   always @(pcselect1 or offset11 or offset9 or offset6)
     case(pcselect1)
       0: addrin1 = offset11;
       1: addrin1 = offset9;
       2: addrin1 = offset6;
       3: addrin1 = 0;
     endcase
   
   always @(pcselect2 or npc or VSR1_int or IR)
   	if(pcselect2)
	 	//if((IR[15:12] == 4'b0000) || (IR[15:12] == 4'b1100) ) Ignore
		//	addrin2 = npc - 1;Ignore
		//else Ignore
       			addrin2=npc;
	else addrin2=VSR1_int;
  
   always @(posedge clock)
        if (reset)
                pcout <= 0;
        else if (enable_execute)
                pcout <= addrin1 + addrin2;   
`endprotect
endmodule


module extension(ir, offset11, offset9, offset6, trapvect8, imm5);
   
input [15:0] ir;
output [15:0] offset11, offset9, offset6, trapvect8, imm5;

`protect
  assign offset11 = {{5{ir[10]}}, ir[10:0]};
  assign offset9  ={{7{ir[8]}}, ir[8:0]};
  assign offset9  ={{8{ir[7]}}, ir[7:0]};
  assign offset6  ={{10{ir[5]}}, ir[5:0]};
  assign imm5	  ={{11{ir[4]}}, ir[4:0]};
  //assign imm5	  ={{12{ir[3]}}, ir[3:0]}; Error
  assign trapvect8	={ {8{ir[7]}}, ir[7:0]};

endmodule 

module ALU(clock, reset, aluin1, aluin2, alu_control, enable_execute, aluout, alucarry);
   
input clock, reset;
input [15:0] aluin1, aluin2;
input [1:0] alu_control;
input enable_execute;

output [15:0] aluout;
output alucarry;
   
reg [15:0] aluout;
reg alucarry;

`protect
   always @(posedge clock)
     if (reset)
       begin
  	  alucarry <= 0;
  	  aluout <= 0;
       end
     else if (enable_execute)
       begin
  	  case(alu_control)
    	    	0: {alucarry,aluout}	<= aluin1+ aluin2;	
    	    	1: {alucarry,aluout}	<= {1'b0, aluin1 & aluin2};	
    	    	//1: {alucarry,aluout}	<= {1'b0 , {aluin1 & {aluin2[15:7],aluin2[5], aluin2[6], aluin2[4:0]}}}; Error
		2: {alucarry,aluout}	<= {1'b0, ~aluin1};
    	  default: {alucarry,aluout}	<=~(aluin1^aluin2);
   	  endcase
       end	
`endprotect
endmodule 

