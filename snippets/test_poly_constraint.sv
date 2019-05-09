class test_poly_shape;


endclass

class test_poly_circle extends test_poly_shape;
int unsigned radius;
virtual function unsigned area(); // Function overriding by using virtual keyword
// No function overloading in SV
return PI*radius*radius;
endfunction
endclass

class test_poly_triangle extends test_polu_shape;
int unsigned base,height;
function unsigned area();
return base*height/2;
endfunction
endclass

module test_poly_constraint;

