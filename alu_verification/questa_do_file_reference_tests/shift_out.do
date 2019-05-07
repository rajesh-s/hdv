# shift output do file for DUT 10>>2
# run this file is QuestaSim using do <filename.do>
cd ..
vlog *.sv
vsim -novopt DUT
add wave *
force -freeze sim:/DUT/clock 0 0, 1 {50 ns} -r 100
force -freeze sim:/DUT/reset 1'h0 0
force -freeze sim:/DUT/enable_ex 1'h1 0
force -freeze sim:/DUT/src1 32'd10 0
force -freeze sim:/DUT/src2 32'd5 0
force -freeze sim:/DUT/control_in 7'b1001 0
run
force -freeze sim:/DUT/control_in 7'h0001 0
run
force -freeze sim:/DUT/imm 32'b10000000 0
run
run 
run
run
run
run
