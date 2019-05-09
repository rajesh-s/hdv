/*Predict the output*/
module problem_13;
class problem_13;
rand bit x;
rand bit [2:0] y;
constraint c { y inside {[x:5]};}
constraint c1{solve y before x;}
endclass
problem_13 i;
initial
begin
	i = new();
	repeat(100)
		if(i.randomize())
			$display("x =%0d , y=%0d",i.x,i.y);
		else
			$display("Randomization failed");
end
endmodule
