module race_condition_delay;

initial 
  $display(" Initial 1");

initial 
#1  $display(" Initial 2");

initial 
#2  $display(" Initial 3");
endmodule
