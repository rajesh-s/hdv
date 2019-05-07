interface intf;
bit [2:0]a,b;
bit [2:0]s;bit c;
modport drv(output a,b);
modport mon(input s,c);
endinterface
