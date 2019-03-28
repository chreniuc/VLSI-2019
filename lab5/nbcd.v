module sum4(A, B, Cin, S, Cout);
input [3:0] A;
input [3:0] B;
input Cin;
output reg [3:0]S;
output reg Cout;

always @(A or B or Cin)
begin
  if(A+B+Cin <=15)
  begin
    Cout=0;
    S=A+B+Cin;
  end
  else
  begin
   Cout=1;
   S=A+B+Cin;
  end
end
endmodule


module test_sum4();
reg [3:0] A;
reg [3:0] B;
reg Cin;
wire [3:0] S;
wire Cout;

initial begin
 A=1;
 B=3;
 Cin=0;
 #10 Cin=1;
 #10 A=14;
end
sum4 sumator_test_4(A,B,Cin, S,Cout);
endmodule

module comparator4(A,B, mic, egal, mare);
input [3:0] A;
input [3:0] B;
output reg mic;
output reg egal;
output reg mare;

always @(A or B)
begin
  if(A>B)
    {mic, egal, mare}=3'b001;
  else if(A==B)
    {mic, egal, mare}=3'b010;
  else
    {mic, egal, mare}=3'b100;
end
endmodule


module comparator4_test();
reg [3:0] A;
reg [3:0] B;
wire mic;
wire egal;
wire mare;

initial begin
  A=0;
  B=0;
  #10 A=1;
  #10 B=3;
end
comparator4 comparator4_testing(A,B,mic,egal,mare);
endmodule




// convertor de cod NBCD – Exces 3 

module NBCD_exces_3(N, VCC, GND, Cout, Y, egal, mare);
input [3:0] N;
input VCC;
input GND;
output Cout;
output [3:0] Y;
output egal;
output mare;

wire [3:0] S;
wire mic;

comparator4 comparator(N, {VCC,GND,VCC,GND}, mic, egal, mare);
sum4 sumator(N, {GND, GND,VCC,VCC}, GND, S, Cout);

and p1(Y[0], S[0], mic);
and p2(Y[1], S[1], mic);
and p3(Y[2], S[2], mic);
and p4(Y[3], S[3], mic);

endmodule


module NBCD_exces_3_test();
reg [3:0] N;
reg VCC;
reg GND;
wire Cout;
wire [3:0] Y;
wire egal;
wire mare;
integer i;

initial begin
  VCC=1;
  GND=0;
  N=0;
  for(i=0; i<=15; i=i+1)
   #10 N=i;
end
NBCD_exces_3 NBCD_exces_3_instance(N, VCC, GND, Cout, Y, egal, mare);
endmodule
