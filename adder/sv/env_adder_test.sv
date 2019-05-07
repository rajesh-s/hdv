module env_adder_test(intf i);
environment en;
initial
begin
en=new(i);
en.build();
repeat(10) begin
en.run();
end
end
endmodule
//   using program and endprogram will infer an implicit $finish. 
