module ram(A, CLK, OE, WE, DOUT);
input [3:0]A;
input CLK, OE, WE;
inout [3:0]DOUT;

reg[3:0] memorie[15:0];
reg[3:0] data_Read;

assign DOUT = data_Read;

always@(posedge CLK) begin
  if(OE == 0)
    data_Read=4'bz; // inalta impendanta
  else
  begin
    if(WE == 0)
      data_Read=memorie[A];
    else
      begin
       data_Read=4'bz;
       memorie[A]=DOUT;
      end
  end
end
endmodule

module ram_test();
wire [3:0]DOUT;
reg [3:0]A;
reg CLK, OE,WE;
reg [3:0]data_write;
integer i;

assign DOUT=data_write;
always #5 CLK=~CLK;

initial begin
   // Scriere in memorie
  data_write=0;
  WE=1;
  OE=1;
  CLK=0;
  A=0;
 for(i=0;i<16;i=i+1) begin
  #20 A = i;
  data_write = i;
 end 
 // Citire din memorie
 WE=0;
 data_write = 4'bz;
 for(i=0;i<16;i=i+1) begin
   #20 A = i;
  end
end
ram ram_component(A, CLK, OE, WE, DOUT);
endmodule
