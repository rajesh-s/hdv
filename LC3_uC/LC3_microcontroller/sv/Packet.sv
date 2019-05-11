//typedef enum {ADD:16'h1, AND:16'h5, NOT:16'h9, LEA:16'hE} instruction;
class Packet;

//Declare all inputs as rand variables      
rand reg complete_instr;
rand reg complete_data;
rand reg [0:15] Instr_dout;
rand reg [0:15] Data_dout;
// Declaring outputs as packet needs to have space allocated alongside
logic [15:0] 	pc, Data_addr;
logic instrmem_rd, Data_rd; 
logic [15:0]	Data_din;
logic D_macc, I_macc;
logic reset;

//rand instruction instruction1;

//Constraints defined on the inputs
constraint c1{ 
	complete_instr inside{1};
	complete_data inside{1};
	Instr_dout inside {16'h1422,16'h5020,16'hEDFE,16'h1280,16'h903F};
	Data_dout inside{[16'h3006 : 16'h3011]};}

//constraint c2{ 
//	instruction1 == ADD -> (Instr_dout[15:12] == 16'h1)	

//Extern function for the packet
//extern function new();//string name = "Packet");
endclass

//Non default constructor for new
//function Packet :: new ();//string name ="Packet");
//this.name = name;
//endfunction

/*
5020 (AND R0 R0 #0);
1422 (ADD R2 R0 #2);
1280 (ADD R1 R2 R0);
EDFE (LEA R6 #-2);
*/
