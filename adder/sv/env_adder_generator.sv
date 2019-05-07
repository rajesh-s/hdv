class generator;
packet pkt;
mailbox #(packet)gen_drv;
function new(mailbox #(packet)gen_drv);
this.gen_drv=gen_drv;
endfunction
task run;
pkt=new();
if(pkt.randomize())
begin
gen_drv.put(pkt);
end
else $display("randomization failed");
endtask
endclass
