
# ALU based on a modification to the DLX ISA

## Details

The designs were simulated and verified on QuestaSim 64 10.5a Revision : 2016.04 [auth: 16-07-2016 RAJESH S] 

1. do_file_reference_tests folders contains reference test cases to verify the functionality of the top level DUT module.
	Go to the do_file_reference_tests folder in QuestaSim and then execute the do files using the command
	"do <filename.do>"
	- addition_out.do performs addition of 10 + 5 at the top level
	- shift_out.do performs 10 >> 2 shift operation

2. Verification of DUT waveforms consists of log screenshots of observed waveforms for signal by signal output verification

3. This root folder consists of the following SystemVerilog modules hierarchy
    
    (top)	
    
    DUT.sv   - EXECUTE_PREPROCESSOR.sv
        		
             - ALU.sv                    -  ARITH_ALU.sv 
	                                 -  SHIFT_ALU.sv

	
