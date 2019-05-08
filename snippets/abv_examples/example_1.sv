module example_1(
input ifcond,a,b,
output logic if_out
);
always_comb begin
assert(^ifcond !== 1'bx)// Pass statement is optional -> Can have $display
else $error("ifcond == X"); // Does not generate any hardware. Time at which encountered is also displayed, better observability
// Only the immediate block will be considered for execution if assertion does not fail
// Assertions cannot modify variable values as that would disturb the functionality of the desgin
//$finish. $stop can also be used to stop simulation when assertion is encoutnered
// assert(property) <Pass st.> else <Fail st.>
if(ifcond)
if_out = a;
else
if_out = b;
end
endmodule


/*
Always write assertions within procedural block ( and not with continuous assignments)

Not recommended to use $display in the else block.
Immediate fail assertions in decreasing order of severity
$ fatal
$ error
$ warning 
$ info
*/
