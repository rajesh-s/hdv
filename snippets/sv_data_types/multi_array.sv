module multi_array;
// Unpacked Multidimensional arrays
int arr [0:1] [0:3]= '{'{7,6,5,2},'{2,3,4,6}};// Ordering can be changed
// By inverting the indices. The initialization implicitly assigns position
// Can be used with replication operator as well '{2{'{7,6,4,3}}}
// For default initialization of all elements use '{default:3}for single dimensional array
// For multidimensional  '{'{default:3},'{3:0,4:5,default:0}
initial
begin
for(int i =0; i<2; i++)
begin
for(int j =0; j<4; j++)
$write("arr[%0d][%0d] = %d \t",i,j,arr[i][j]); // Only arr will print all the elements
$display(" ");
end
end
endmodule
