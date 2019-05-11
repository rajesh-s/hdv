module fourth;
struct packed
{
	integer payload;
	bit [11:0] data;
	shortint crc;
} fourth = '{-1,0,-1};

initial
begin
$display("%b",fourth);
end
endmodule

