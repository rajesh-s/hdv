// To generate random real number, system function $bitstoreal can be used
// random generates negative as well, urandom (unsignedrandom) 
// cannot be used as negative real is not defined
module test_bitstoreal;
real r_num;// or shortreal
initial
begin
	repeat(5)
	begin
		#1 r_num = $bitstoreal({$random,$random});// Second $random to avoid 2.0 4.0 kind values 
		$display("r_num = %g",r_num);
	end
end
endmodule
