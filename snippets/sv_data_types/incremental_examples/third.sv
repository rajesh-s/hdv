module third;
int third [0:1][0:3]= '{'{default:0,3:42},'{default:0,0:45}};
initial
begin
for(int i =0; i<2; i++)
begin
for(int j =0; j<4; j++)
$write("third[%0d][%0d] = %d \t",i,j,third[i][j]); 
$display(" ");
end
end
endmodule
