module test_final;
initial
begin
	for(int i =0; i<10; i++)
	begin
		if((i>=5) && (i<8))
		begin $display("continue",$time);
		      continue;
		end
	#1 $display("Current value of i = %d",$time,i);
	end
end
final
begin
$display("Final block",$time);
$display("No delays allowed inside my block");
end// Upon end simulation, no delays allowed. Used to display hit / misss
endmodule
