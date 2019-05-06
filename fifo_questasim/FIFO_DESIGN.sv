`define FIFO_DEPTH 16 // FIFO depth
`define DATA_WIDTH 8 // Data bus width
`define PTR_SIZE 4 // Read and Write pointers size
module FIFO_DESIGN
	(clock,
	reset_n,
	read_n,
	write_n,// Active low signals
	data_in,
	data_out,
	over_flow,
	under_flow );

input clock, reset_n, read_n, write_n;// Input data 
input [`DATA_WIDTH-1:0] data_in;//Output data 
output [`DATA_WIDTH-1:0] data_out;
output under_flow, over_flow;//Flags to indicate the FIFO status

reg under_flow, over_flow;
reg full,empty;
reg [`DATA_WIDTH-1:0] data_out; 
reg [`DATA_WIDTH-1:0] fifo_mem [0:`FIFO_DEPTH-1]; //FIFO Memory
reg [`PTR_SIZE-1:0] fifo_status; //fifo_status to track the FIFO status
reg [`PTR_SIZE-1:0] read_ptr; //Read from next location
reg [`PTR_SIZE-1:0] write_ptr; //Write into next location

//Reading and Writing of FIFO
always @ (posedge clock or negedge reset_n) // Synchronous FIFO with Asynchronous reset_n- reset_n 
begin
	if(~reset_n)
		begin
			under_flow <= 1'b0;
			over_flow <= 1'b1;
		end 
	else
		begin
			if(~read_n)
				begin
					if(!empty)//If empty is turned low -> data is output
						begin
							data_out <= fifo_mem[read_ptr];
							under_flow <= 1'b0;
						end
					else
						begin
							$display("READ ERROR: FIFO IS EMPTY \n");
							under_flow <= 1'b1;
						end
				end
			else
				under_flow <= 1'b0;
				if(~write_n)
					begin
						if(!full)		
							begin
								fifo_mem[write_ptr] <= data_in;
								over_flow <= 1'b0;
							end
						else
							begin
								$display("WRITE ERROR: FIFO IS FULL \n");
								over_flow <= 1'b1;
							end
					end 
				else
					over_flow <= 1'b0;
		end 
end

//Read Pointer and Write Pointer
always @ (posedge clock or negedge reset_n)
begin
	if(~reset_n)
		begin
			read_ptr <= `PTR_SIZE'b0;
			//read_ptr <= `PTR_SIZE'b1; //Error in DUT - reset_n assertion will fail
			write_ptr <= `PTR_SIZE'b0; // We can use this only if `PTR_SIZE is available at runtime. Not allowed to have PTR_SIZE as input
		end
	else
		begin
			if(~read_n && ~empty)
				begin
					if (read_ptr == `FIFO_DEPTH-1)
						read_ptr <= `PTR_SIZE'b0;
					else
						read_ptr <= read_ptr + 1'b1;
				end

			if(~write_n && ~full)
				begin
					if (write_ptr == `FIFO_DEPTH-1)
						write_ptr <= `PTR_SIZE'b0;
					else
						write_ptr <= write_ptr + 1'b1;
						//write_ptr <= write_ptr + 1'b0; // Error - ASSERTION -WRITE will catch this bug
				end
		end
end

//Tracking the FIFO status - Number of elements present at any time - Current Size
always @ (posedge clock or negedge reset_n)
begin
	if(~reset_n)
		fifo_status <= `PTR_SIZE'b0;
	else if((fifo_status==`FIFO_DEPTH-1) && (~write_n))
		fifo_status<=`FIFO_DEPTH-1;
	else if((fifo_status==`PTR_SIZE'b0) && (~read_n))
		fifo_status<=`PTR_SIZE'b0;
	else if(read_n==1'b0 && write_n==1'b1 && empty==1'b0)
		fifo_status <= fifo_status - 1'b1;
	else if(write_n==1'b0 && read_n==1'b1 && full==1'b0)
		fifo_status <= fifo_status + 1'b1;
end

//Generating the flags from FIFO status - FULL or EMPTY
always @ (posedge clock or negedge reset_n)
begin
	if(~reset_n)
		begin
			full <= 1'b0;
			empty <= 1'b1;	
		end
	else
		begin
			if(fifo_status == `FIFO_DEPTH-1)
				full <= 1'b1;
			else
				full <= 1'b0;

			if(fifo_status == `PTR_SIZE'b0 )
				empty <= 1'b1;
			else
				empty <= 1'b0;
		end
end
endmodule
