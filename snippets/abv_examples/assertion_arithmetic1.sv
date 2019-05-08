module assertion_arithmetic1
(input [3:0] A, B,
output logic [4:0] Q1,
output logic [3:0] Q2, Q3,
output logic [7:0] Q4);
always_comb
begin
assert(A^B!==4'bx) else $warning("Input is xx");// Returns x 
Q1 = A + B; //addition
Q2 = A - B; //subtraction
Q3 = A / 2; //division
Q4 = A * B; //multiplication
end
endmodule
