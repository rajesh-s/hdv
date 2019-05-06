module FIFO_TESTBENCH;

reg clock, reset_n, read_n, write_n;
reg [7:0] data_in;
wire [7:0] data_out;
wire under_flow, over_flow;

FIFO_DESIGN DUV
	(.clock(clock),
	 .data_in(data_in),
	 .read_n(read_n),
	 .reset_n(reset_n),
	 .write_n(write_n),
	 .data_out(data_out),
	 .over_flow(over_flow),
	 .under_flow(under_flow) );

bind FIFO_DESIGN:DUV FIFO_ASSERTIONS sva (clock,reset_n,read_n,write_n,over_flow,under_flow);

//Clock generation
always
	begin
		#5 clock = 1'b0;
		#5 clock = 1'b1;
	end

//Reset the FIFO
task reset_fifo;
begin
	reset_n <= 1'b0;
	data_in <= $random;
	read_n <= 1'b1;
	write_n <= 1'b1;
	repeat(3)
	@(negedge clock);
		reset_n <= 1'b1;
end
endtask

//Write / Read
task wr_rd (input [15:0] wr_data, input wr, input rd);
begin
	data_in = wr_data;
	read_n = rd;
	write_n = wr;
	
	if(~write_n)
		$display("FIFO WRITE: Data = %d \n", data_in);
	@(posedge clock);
	@(negedge clock);

	if(~read_n)
		$display("FIFO READ: Data = %d \n", data_out);
end
endtask

initial
begin: STIM
	integer i;
	reset_fifo;
//Writing Data into all the locations
	$display("\n\n ************ WRITING INTO FIFO ************* \n\n ");
	for(i=16; i>0; i=i-1)
		begin
			wr_rd(i,1'b0,1'b1);
		end

//Writing when FIFO is full
	wr_rd(8'b1,1'b0,1'b1);
	wr_rd(8'b1,1'b0,1'b1);

//Reading Data
	$display("\n\n ************ READING FIFO ************* \n\n ");
	repeat(16)
		begin
			wr_rd(8'd0,1'b1,1'b0);
		end

//Reading when FIFO is empty
	wr_rd(8'b0,1'b1,1'b0);
	wr_rd(8'b0,1'b1,1'b0);

//Write then Read

//Write
	wr_rd(8'd0,1'b0,1'b1);
	wr_rd(8'd1,1'b0,1'b1);
//Read
	wr_rd(8'd0,1'b1,1'b0);
	wr_rd(8'd0,1'b1,1'b0);

//Write and Read
	wr_rd(8'd2,1'b0,1'b1);
	wr_rd(8'd3,1'b0,1'b1);

//Simultaneous Read & Write
	wr_rd(8'd8,1'b0,1'b0);
$finish;
end

initial
begin
	$monitor("********* FIFO : Underflow = %b, Overflow = %b**********",under_flow,over_flow);
end
endmodule
