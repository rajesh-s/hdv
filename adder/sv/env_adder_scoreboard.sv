class scoreboard;
packet pkt1,pkt2;
mailbox #(packet)drv_sb;
mailbox #(packet)mon_sb;
function new(mailbox #(packet)drv_sb,mailbox #(packet)mon_sb);
	this.drv_sb=drv_sb;
	this.mon_sb=mon_sb;
endfunction
task run;
	mon_sb.get(pkt1);
	drv_sb.get(pkt2);
	{pkt2.c,pkt2.s}=pkt2.a+pkt2.b;
	if(pkt1.c==pkt2.c && pkt1.s==pkt2.s)
	begin
		$display(" design is ok");
		$display($time,"a=%b b=%b s=%b c=%b",pkt1.a,pkt1.b,pkt1.s,pkt1.c);
	end
	else
	begin
		$display(" design is not ok");
		$display($time,"a=%b b=%b s=%b c=%b",pkt1.a,pkt1.b,pkt1.s,pkt1.c);
	end
endtask
endclass
