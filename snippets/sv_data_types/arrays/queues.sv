/*Dynamic array and Queues use contiguous locations. Multiple element access is allowed
insertion and removal only at the beginning or end of the queue. 1D unpacked that grows
and shrinks automatically.
Queues are very useful in modeliing FIFO and LIFO buffers. To verify verilog design for those*/
module queues;
int q[$];// $ represents variable size queue. Last iterator $ last element. First iterator 0
int d[];
/* push front pushed the first element to q[3] after 3 iterations
(head) q[0] > q[1] > q[2] > q[3] (tail) Push Front. Inserts at front of the queue
Push Back inserts at the back of the queue ( Back means higher index. Further away)
Pop Front removes and returns first element of the array ie q[0] 
Pop Back removes and returns the last element of the queue ie q[3]
insert elongates the queue and delete shrinks it.
Application:
Move dynamic array contents to a queue for manipulations and then move it back to dynamic.*/

initial
begin

	d = new[100];
	d[32] = 32;
	d[64] = 64;
	d[67] = 67;
	d[74] = 74;
	q = d;
// Manipulations using queue on dynamic array
	q.insert(33,33);
	q.delete(32);
	for(int i=0; i<q.size(); i++)
		$write(" q[%0d] = %0d \t",i,q[i]);
	$display("\n");
	d = q;
	$display("Dynamic array after Manipulation using queue:");
	foreach(d[i])
		$write(" d[%0d] = %0d \t",i,d[i]);
		
	$display("Check");
	$display("  %p \t",q[0:4]);
end
endmodule
