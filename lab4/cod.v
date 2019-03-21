module sumator_4(A, B, Cin0, S, Cout3);
output reg [3:0] S;
output reg Cout3;
input [3:0] A;
input [3:0] B;
input Cin0;


always @(A or B or Cin0)
begin
 if(A+B+Cin0 <= 15)
  begin
  Cout3 = 0;
  S = A+B+Cin0;
  end
else
  begin
  Cout3 = 1;
  S=A+B+Cin0;
  end
end
endmodule;

module sumator4_test();
reg [3:0] A;
reg [3:0] B;
reg Cin0;
wire [3:0] S;
wire Cout3;

initial begin
 A=0;
 B=0;
 Cin0=0; 
 #10 A=1;
 #10 B=1;
 #10 Cin0=1;
 #10 A=15; B=12;
 end
 sumator_4 sumator(A,B,Cin0, S, Cout3);
endmodule

// Exercitiul 2:
module comparator(A, B, lw, eq, gr);
output reg eq, lw, gr;
input [3:0] A;
input [3:0] B;

always @(A or B)
begin
 if(A<B)
  begin
  eq = 0;
  gr = 0;
  lw = 1;
  end
else if (A==B)
  begin
  eq = 1;
  gr = 0;
  lw = 0;
  end
else
  begin
  eq = 0;
  gr = 1;
  lw = 0;
  end
end
endmodule;

module comparator_test();

reg [3:0] A;
reg [3:0] B;
wire lw, eq, gr;

initial begin
 A=0; B=0;
 #10 A=1;
 #10 B=3;
end
comparator comp(A,B,lw,eq,gr);
endmodule



// Exercitiul 3

module mux4_1(E, D, S, Y);
output reg Y;
input E;
input [3:0] D;
input [1:0] S;

always @(E or D or S) begin
  if(E == 1)
    Y = 0;
  else
   begin
    case (S)
      0: Y = D[0];
      1: Y = D[1];
      2: Y = D[2];
      3: Y = D[3];
      default: Y =0;
     endcase
   end
end
endmodule

module mux4_1_test();

reg E;
reg [3:0] D;
reg [1:0] S;
integer i;

wire Y;

initial begin
E = 1;
D = 4'b1010;
S = 1;
i=0;

#10 E = 0;
for(i=0; i<4; i=i+1)
 begin
  #10 S= i;
 end
end
mux4_1 muxtest(E, D, S, Y);
endmodule

// Exercitiul 4

module decodificator_3(A, E,Y);
output reg [7:0]Y;
input [2:0] A;
input E;

always @(E or A) begin
 if( E == 0)
   Y = 0;
  else
   Y = 2**A;
end
endmodule

module decodificator_test();

reg E;
reg [2:0] A;
wire [7:0] Y;
integer i;

initial begin
 E= 0;
 A = 1;
 i = 0;
 for(i =0; i <= 7; i=i+1)
   #10 A = i;

 E= 1;
 A = 0;
 i = 0;
 for(i =0; i <= 7; i=i+1)
   #10 A = i;

end
decodificator_3 decod(A, E, Y);

endmodule
