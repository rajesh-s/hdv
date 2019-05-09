module test_imp_op;

typedef enum {short,legal,long} packet_type;

class test_imp_op;
rand packet_type pt;
rand integer packet_length;
rand bit payload[]; // Generates random packets with binary digits of different lenghts
constraint c1 { payload.size == packet_length;}// constraint imposed such that payload size = packet lengh
constraint c2 { pt == short -> packet_length<20;}
constraint c3 { pt == legal -> packet_length inside {[20:100]};}
constraint c4 { pt == long  -> packet_length inside {[101:200]};}
// New keyword is not required as we are assigning a random static to dynamic 
task display;
begin
$display(" The size of the packet is %0d, \n The payload is %p,\n The packet_type is %s",packet_length,payload,pt.name);
end
endtask
endclass

initial
begin
test_imp_op p;
p = new();
repeat(3)
begin
p.randomize() with {pt == short;};
//p.randomize() with {pt == legal;}; // inline constraints specified to generate and filter only legal packets
p.display();
end
end
endmodule
