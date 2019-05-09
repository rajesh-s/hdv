program test_program_block_tb2(input clk);
initial
forever// Always block is removed as it cannot be included in the program block
begin
@(posedge clk)
test_program_block_tb3.dut3.siga <= test_program_block_tb3.dut3.sigb;// Waits for the dut to settle
// From the test bench for  written for this program block in tb3 
end
endprogram

// THESE RESULTS ARE DISPLAYED AS IT OCCURS IN THE REACTIVE REGION and the value of b from dut 
// MANIPULATION IS COPIED TO A IN THE PROGRAM BLOCK. NO MORE RACE AROUND
// Program block comes after the observation and non blocking resgions
