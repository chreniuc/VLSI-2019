module exemplu(input [7:0] x, output y);

assign y=x[7] & x[6] & x[5] & x[4];
//assign y=x[5] | x[3] & x[0];

endmodule

module test_exemplu;
reg [7:0] x;
wire y;

exemplu DUT(x,y);

initial begin
x=8'b01010101; // momentul 0 (8 biti in baza 2)
// x=2'd43 ()
#20 x=8'b11110000; // intarziere 20 picosecunde fata de prima instructiune
end
endmodule
