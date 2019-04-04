
module numarator4(data, up_down, enable, load, clock, reset, result, terminal_count);
input [3:0] data;
input up_down;
input enable;
input load;
input clock;
input reset;
output reg [3:0] result;
output reg terminal_count;


always @(posedge clock or posedge load or posedge reset) begin
  if(load)
   result = data;
  else
   result = 0;
   
  if(reset)
  begin
    result = 0;
    terminal_count =0;
  end

  if(enable == 1)
  begin
    if (up_down == 1)
    begin
      result = result + 1;
      if( result == 15)
         terminal_count = 1;
      else
         terminal_count = 0;
    end
    if(up_down == 0)
    begin  
      result = result - 1;
      if( result == 0)
         terminal_count = 1;
      else
         terminal_count = 0;
    end
  end
end
endmodule



module numarator_test();

reg [3:0] data;
reg up_down;
reg enable;
reg load;
reg clock;
reg reset;
wire [3:0] result;
wire terminal_count;


initial begin
  reset =0;
  clock = 0;
  enable = 1;
  data =10;
  up_down =1;
  load =1;
  clock =0;
  forever
    begin
    #5 clock = ~clock; load =0;
    end 
end
numarator4 num4_test(data, up_down, enable, load, clock, reset, result, terminal_count);
endmodule

module desc_numarator_test();

reg [3:0] data;
reg up_down;
reg enable;
reg load;
reg clock;
reg reset;
wire [3:0] result;
wire terminal_count;
integer i;


initial begin
  reset =0;
  clock = 0;
  enable = 1;
  data =10;
  up_down =0;
  load =0;
  clock =0;
  
  for(i = 0; i < 20; i = i+1)
    begin
    #5 clock = ~clock;
    if(i == 10)
      begin
       reset = 1;
       #5 reset =0;
     end
    if(i == 2)
    begin
       load = 1;
       #5 load =0;
    end
  end
end
numarator4 num4_test(data, up_down, enable, load, clock, reset, result, terminal_count);
endmodule
