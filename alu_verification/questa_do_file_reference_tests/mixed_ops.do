cd ..
vlog *.sv
vsim -novopt DUT
add wave *
force -freeze sim:/DUT/clock 1 0, 0 {50 ns} -r 100
force reset 1
run
run
run
force reset 0
force enable_ex 1
force src1 32'd20
force src2 32'd10
force imm 32'd5
force control_in 7'b0001100
force mem_data_read_in 32'd40
run
force control_in 7'b0000001
run
run
run
force control_in 7'b0001001
run
run
run
force control_in 7'b0100001
run
run
run
force src2 -32'd5
force control_in 7'b0100001
run
run
run
force src2 32'd10
force src1 32'd12
force control_in 7'b0110001
run
run
run
force src2 32'd10
force control_in 7'b1000001
run
run
run
force src2 32'd10
force control_in 7'b1010001
run
run
run
force control_in 7'b1100001
run
run
run
force imm 32'h0000ffff
force control_in 7'b0001101
run
run
run
force control_in 7'b1001101
run
run
run
force control_in 7'b0011101
run
run
run
force control_in 7'b1011101
run
run
run
force control_in 7'b0111101
run
run
run
force src1 32'd12
force src2 32'd2
force control_in 7'b0001000
run
run
run
force control_in 7'b0011000
run
run
run
force control_in 7'b0101000
run
run
run
force src1 -32'd12
force control_in 7'b0111000
run
run
run
force src1 32'd12
force control_in 7'b0010001
run
run
run
run
run
run
run
run

