module mux2_1_a(input SEL, A, B, output out);

wire w1, w2, s3;
not gate_NU(w1, SEL);
and gate1_SI(w2, w1, A);
and gate2_SI(w3, SEL, B);
or gate_SAU(out, w2, w3);

endmodule


module mux2_1_b(input SEL, A, B, output out);
assign out = (~SEL & A) | (SEL & B);
endmodule

module mux2_1_c(input SEL, A, B, output out);
assign out = (SEL == 0 ) ? A : B;
endmodule


module mux_2_1_test();
 reg Aa, Ba, SELa, Ab, Bb, SELb, Ac, Bc, SELc;
 wire outa, outb, outc;
 initial begin
  Aa=0; Ba=0; SELa=0;
  Ab=0; Bb=0; SELb=0;
  Ac=0; Bc=0; SELc=0;
  #10 Aa=1; Ab=1; Ac=1;
  #10 SELa=1; SELb=1; SELc=1;
  #10 Aa=0; Ba=1; Ab=0; Bb=1; Ac=0; Bc=1;
 end
 mux2_1_a MUX1(SELa, Aa, Ba, outa);
 mux2_1_b MUX2(SELb, Ab, Bb, outb);
 mux2_1_c MUX3(SELc, Ac, Bc, outc);
endmodule



// Exercitiul 2:

module sum_1(input A, B, Cin, output Cout, out);
// Cin e bit de transport de intrare, Cout e bit de transport de iesire
//wire [1:0]iesire;
assign {Cout, out} = A + B + Cin;
endmodule

module test_sum_2();
reg A, B, Cin;
wire Cout, out;
initial begin
  A=0; B=0; Cin=0;
  #10 Cin=1;
  #10 Cin=0; B=1;
  #10 Cin=1; 
  #10 A=1; Cin=0; B=0;
  #10 Cin=1;
  #10 Cin=0; B=1;
  #10 Cin=1;
  end
  sum_1 nume(A,B,Cin,Cout,out);
endmodule


module sum_4(input [3:0]A, [3:0]B, Cin, output Cout, [3:0]S);
sum_1 sum0(A[0], B[0], Cin, w1, S[0]);
sum_1 sum1(A[1], B[1], w1, w2, S[1]);
sum_1 sum2(A[2], B[2], w2, w3, S[2]);
sum_1 sum3(A[3], B[3], w3, Cout, S[3]);
endmodule


module sum4_test();
reg [3:0]A;
reg [3:0]B;
reg Cin;
wire [3:0]S;
wire Cout;
integer i;
integer j;
initial begin
  Cin=0; A=0; B=0; j=0;
  for(i=1; i <= 15; i=i+1)
   begin
   #10 A=i;
   for(j=1; j < 15; j=j+1)
    begin
     #10 B=j;
    end
   end
end
sum_4 nume(A,B,Cin, Cout,S);
endmodule;


// Exercitiul3

module mux4_1(input [3:0]IN, [1:0]SEL, output out);
assign out = IN[SEL];
endmodule

module mux8_1(input [7:0]IN, [2:0]SEL, output out);
mux4_1 MUX1(IN[3:0], SEL[1:0], out30);
mux4_1 MUX2(IN[7:4], SEL[1:0], out74);
assign out = (out30 & ~SEL[2])|(out74 & SEL[2]);
endmodule


module mux_8_1_test();

reg [7:0]IN;
reg [2:0]SEL;
wire out;
integer i;
initial begin
 IN =8'b10101010; SEL=0;
 for(i=0; i<=8; i=i+1)
  #10 SEL=i;
end
mux8_1 MUX8(IN, SEL, out);
endmodule
