module Decode(	
clock, reset, enable_decode, dout, E_Control, 
npc_in, Mem_Control, W_Control, IR, npc_out
); 

input clock, reset, enable_decode;
input [15:0] dout; // Same as instr_dout, coming from the Instruction memory corresponding to (Program Counter) Address in decode block
input [15:0] npc_in;

output [1:0] W_Control; // Writeback block control 
output       Mem_Control; // Declared as a wire
output [5:0] E_Control; // Execute block control
output [15:0] IR; // Instruction Register corresponds to instr_dout
output [15:0] npc_out;
   
reg [1:0] W_Control;
reg [15:0] IR, npc_out;
 
reg 	  M_Control; // Temporary Register Declaration
reg [1:0] inst_type; 
reg 	  pc_store;
reg [1:0] pcselect1, alu_control;
reg 	  pcselect2, op2select;

wire [3:0] opcode; // = dout[15:12];
assign opcode = dout[15:12]; // Use assign keyword instead of the above line

assign Mem_Control = M_Control;
assign E_Control = {alu_control, pcselect1, pcselect2, op2select};
   
always @(posedge clock)
	if(reset)
			begin
				IR <= 0;
				npc_out	<= 0;
       		end
     	else if (enable_decode) 
       		begin
				IR <= dout;
				npc_out	<= npc_in;
				//npc_out <= npc_in + 1; Error
		end	
   
always @(posedge clock)
begin
	if(reset)
  	  	inst_type <= 2'd00;
  	else if (enable_decode) 
  		begin
  	     		case (opcode[1:0])
      	       			2'b00: inst_type <= 2'd1; 
      	       			2'b01: inst_type <= 2'd0; 
      	       			2'b10: inst_type <= 2'd1; 
      	       			2'b11: inst_type <= 2'd2; 
    	     		endcase 
    	  	end	
end  
     
always @(posedge clock) 
begin
	if(reset)
  		begin
  	     		alu_control <= 0;
  	     		op2select 	<= 1;
  	     		pcselect1 	<= 1;
  		     	pcselect2 	<= 0;
  	  	end	
  	else if (enable_decode) 
  		begin //case({opcode[3],opcode[0]}) Error
				case(opcode[1:0])
					2'b00: begin 
         	   			       	alu_control <= 2'd0; 
			 	   				op2select <= 1'b0; 
			    				case (opcode[3:2])
	       	      					2'b00: begin        
				  	   				       	pcselect1 <= 2'd1; 
			          	   					pcselect2 <= 1'b1; 
		       						       end
	       	      					2'b11: begin        
					  	   					pcselect1 <= 2'd3; 
			          	   					pcselect2 <= 1'b0; 
		       						       end
      	      				      default: begin     
					  	   					pcselect1 <= 2'd0;
	 		         	   					pcselect2 <= 1'b0;
	 	      						       end
	     	    				endcase 
	 	 	 				end
	       			2'b01: begin 
		    					pcselect1 <= 2'd0; 	
	     	    				pcselect2 <= 1'b0; 
								op2select <= ~dout[5];
								//op2select <=  dout[5]; Error
								case (opcode[3:2])
	       	      					2'b00: alu_control <= 2'd0;  	
	       	      					2'b01: alu_control <= 2'd1;   
	       	      					//2'b00: alu_control <= 2'd1; Error  	
	       	      					//2'b01: alu_control <= 2'd0; Error   			
	       	      					2'b10: alu_control <= 2'd2;   
	       	  				      default: alu_control <= 2'd0; 	
	     	 	 				endcase 
	       					end
	       			2'b10: begin 
	     	    				alu_control <= 2'd0; 
          	    				if(opcode[3:2]==2'b01) 
          	      					begin               
		  			 					pcselect1 <= 2'd2; 
		  			 					pcselect2 <= 1'd0; 
									end
	     	    				else 
           	      					begin               
										pcselect1 <= 2'd1;
										//pcselect1 <= 2'd2; Error 
						          	 		pcselect2 <= 1'b1; 
										//pcselect2 <= 1'b0; Error
									end
           		  	    			op2select<=1'b0; 
	  	 					end
	       			2'b11: begin 
		    				alu_control<=2'd0; 
          	    				if (opcode[3:2]==2'b01)
	       	     					begin              
		  			 					pcselect1 <= 2'd2; 
		  								pcselect2 <= 1'b0; 
	       	      					end
	       	    				else 
	       	      					begin          
		  			 					pcselect1 <= 2'd1; 
	       		   	 						pcselect2 <= 1'b1; 
	       	      					end
           		  	    	op2select <= 1'b0; 
	  	 					end
   	     		endcase 
   	     end 
end
   
always @(posedge clock)
begin
	if(reset)
           begin
	   		W_Control <= 2'd0;
	   	   end
	else if (enable_decode) 
  	  begin
       	     case(opcode[1:0])
	       		2'b00: begin  
		    			W_Control	<=	2'd0;  
	  	 			   end
				2'b01: begin 
	     	    		W_Control <= 2'd0;  
 		    			//W_Control <= 2'd1; Error
	  	 			   end
	       		2'b10: begin 
             	    	if (opcode[3:2]==2'b11) 
							begin 
	             	       		W_Control<=2'd2;      
								//W_Control<=2'd0; Error
            	        	end
	     	    		else                    
	       	      			W_Control<=2'd1;      
		 			   end
	       		2'b11: begin 
	       	    	  	W_Control<=2'd0; 
		 			  end
       	     endcase 
      end 
end

   
always @(posedge clock)
begin
	if (reset)
  	  begin	     
	     M_Control <= 0;
  	  end
  	else if (enable_decode) 
  	  begin
       	     case(opcode[1:0])
	       2'b00: begin  
		    		M_Control <= 0;
	  	 		  end
	       2'b01: begin 
		    		M_Control <= 0;
	  	 		  end
	       2'b10: begin 
             	    M_Control <= (opcode[3:2]==2'b10) ? 0 : 1;   
		 		  end
	       2'b11: begin 
             	    M_Control <= (opcode[3:2]==2'b10) ? 1 : 0;  
		 		  end
       	    endcase 
       end 
end  
endmodule

