class environment;
mailbox #(packet)gen_drv;
mailbox #(packet)drv_sb;
mailbox #(packet)mon_sb;
virtual intf i;
generator g1;
coverage c1;
driver d1;
monitor m1;
scoreboard s1;
function new(virtual intf i);
	this.i=i;
	endfunction
	function build;
	gen_drv=new();
	drv_sb=new();
	mon_sb=new();
	g1=new(gen_drv);
	d1=new(gen_drv,drv_sb,i);
	m1=new(mon_sb,i);
	s1=new(drv_sb,mon_sb);
	c1=new(i);
endfunction
task run;
	g1.run();	
	d1.run();
	c1.sample();
	#1 m1.run();
	s1.run();
endtask
endclass
