module exercitiu_1(out, A, B, C);
input A, B, C;
output out;
wire w1,w2,w3;

and(w1, A, B);
and(w2, A, C);
and(w3, B, C);
or(out, w1,w2,w3);

endmodule;

module test_ex_1();
  reg A, B, C;
  wire out;
  initial begin
    A=0; B=0; C=0;
    #10 C=1;
    #10 C=0; B=1;
    #10 C=1;
    #10 C=0; B=0; A=1;
    #10 C=1;
    #10 C=0; B=1;
    #10 C=1;
    end
    exercitiu_1 instanta (out, A, B, C);
endmodule;

// Exercitiul 2

module exercitiu_2(mic, egal, mare, A, B);
input A, B;
output mic, egal, mare;
wire not_A, not_B;

//MIC
not poarta1(not_A, A);
and poarta2(mic, not_A, B);

// EGAL
xnor poarta3(egal, A, B);

// MARE A>B
not poarta4(not_B, B);
and poarta5(mare, not_B, A);
endmodule;

module test_ex_2();
  reg A, B;
  wire mic, mare, egal;
  initial begin
    A=0; B=0;
    #10 B=1;
    #10 B=0; A=1;
    #10 B=1;
    end
    exercitiu_2 instanta (mic, egal, mare, A, B);
endmodule;


// Exercitiul 3

module exercitiu_3(Y[0:3], A, B);
input A, B;
output [0:3]Y;
wire not_A, not_B;

not poarta1(not_A, A);
not poarta4(not_B, B);


// Y0
and gate0_SI(Y[0], not_B, not_A);
// Y1
and gate1_SI(Y[1], B, not_A);
// Y2
and gate2_SI(Y[2], not_B, A);
// Y3
and gate3_SI(Y[3], B, A);
endmodule;


module test_ex_3();
  reg A, B;
  wire [0:3]Y;
  initial begin
    A=0; B=0;
    #10 B=1;
    #10 B=0; A=1;
    #10 B=1;
    end
    exercitiu_3 instanta (Y, A, B);
endmodule;




// Exercitiul 4

module exercitiu_4(Y, A[0:1], I[0:3], E);
input [0:1]A;
input [0:3]I;
input E;
output Y;
wire not_A1;
wire not_A0;

not poarta1(not_A0, A[0]);
not poarta2(not_A1, A[1]);

assign Y = (E == 1 ) ? 0 : (not_A0 & not_A1 & I[0]) | (A[0] & not_A1 & I[1]) | (A[1] & not_A0 & I[2]) | (A[1] & A[0] & I[3]);
endmodule;


module test_ex_4();
  reg [0:1]A;
  reg [0:3]I;
  reg E;
  wire Y;
  initial begin
    A=2'b00; I=4'b0000; E=1;
    #10 E=0;
    #10 A=2'b00; I=4'b1000;
    #10 A=2'b01; I=4'b0100;
    #10 A=2'b10; I=4'b0010;
    #10 A=2'b11; I=4'b0001;
    end
    //exercitiu_3 instanta (Y, A, B);
    exercitiu_4 test(Y, A[0:1], I[0:3], E);
endmodule;
