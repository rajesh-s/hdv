class Environment;
mailbox #(Packet)gen_drv;
mailbox #(Packet)drv_sb;
mailbox #(Packet)rec_sb;

mailbox #(Packet_fetch)rec_sb2;

virtual lc3_io.cg i;

virtual fetch_probe_if i2;

Generator g1;
Driver d1;
Receiver r1;
Scoreboard s1;

function new(virtual lc3_io.cg i, virtual fetch_probe_if i2);
this.i = i;
this.i2 = i2;
endfunction

function build;
	gen_drv = new();
	drv_sb = new();
	rec_sb = new();
	rec_sb2 = new();
	g1 = new(gen_drv);
	d1 = new(gen_drv,drv_sb,i);
	r1 = new(rec_sb,rec_sb2,i,i2);
	s1 = new(drv_sb,rec_sb2);//rec_sb,
endfunction

task run;
fork
	g1.gen();
	g1.start();
	d1.start();
	d1.send();
	r1.start();
	r1.start2();
	r1.recv();
	s1.start();
	//s1.check();
	s1.check_fetch();
join
endtask
endclass

