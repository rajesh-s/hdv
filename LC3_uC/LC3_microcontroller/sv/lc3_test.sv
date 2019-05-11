module lc3_test(lc3_io i, fetch_probe_if i2);// Not necessary to link clocking block at this physical interface
Environment en_obj;
initial
begin
	en_obj=new(i,i2);
	en_obj.build();
repeat(6)
begin
	en_obj.run();
end
end
//task to_reset();
//i.reset=1'b0;
//endtask
endmodule
