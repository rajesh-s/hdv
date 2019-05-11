typedef struct{
byte a;
reg b;
shortint unsigned c;
}mystruct;// handle of a data type used to create object
module struct_data;
struct{
byte a;
reg b;
shortint unsigned c;
}mystructobject = '{10,1,100};
mystruct object = '{10,1,100};
initial
begin
$display("Mystructobject is %p",mystructobject);
$display("Mystruct is %p",object);
end
endmodule
