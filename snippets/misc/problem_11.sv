module problem_11;
class problem_11;
rand int a[];
rand int size;
constraint c1{size>=1; size<=500;} 
//constraint c2 {foreach(a[i]) a[i]>0;}
endclass
initial
begin
	problem_11 d;
	d = new();
	d.randomize();
	d.a = new[d.size];
	
	foreach(d.a[i])
	d.a[i]=$urandom_range(50,1);// Needed since its not static and size is not known inside the class
	$display("%p , Size is %d ",d.a,d.size);
end
endmodule
