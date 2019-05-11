class Packet_fetch;

//Declare all inputs as rand variables 
 bit enable_updatePC;
 bit enable_fetch;
 bit br_taken;
 bit [15:0] taddr; 
//Outputs 
 bit [15:0] pc,npc_out;
 bit instrmem_rd;    
bit reset;

//Constraints defined on the inputs
/*constraint c1{ 
	enable_updatePC inside{0,1};
	enable_fetch inside{0,1};
	br_taken inside{0};}
*/
//Extern function for the fetch packet
//extern function new();//string name1 = "Packet_fetch");
endclass

//Non default constructor for new
//function Packet_fetch :: new (string name1 = "Packet_fetch);//string name1 ="Packet_fetch");
//this.name1 = name1;
//endfunction

