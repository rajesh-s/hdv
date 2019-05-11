module array_ops;

bit [31:0][4:0] one_pack = '{1,2,3,4,5};
//One dimensional 32 bit packed array containing 5 elements

int one_unpack [4:0];

//Second
integer second_1 [0:4] = '{1,2,3,4,5};
integer second_2

//Third
int third [0:1][0:3]= '{'{default:0,4:42},'{default:0,1:45}};

//Fourth
struct
{
	integer payload;
	bit [11:0] data;
	shortint crc;
} fourth;

initial
begin
	for(int i=0; i<5; i++)
		one_unpack[i] = ] one_pack[i];
end
