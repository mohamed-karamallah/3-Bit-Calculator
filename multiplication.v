module multiplication (
     input [2:0] A,  
    input [2:0] B,  
    output [4:0] Product, 
    output ZF,     
    output SF    
);

  wire X1; // tani and
  wire X2; //talet and 
  wire X3; //rabe3 and
  wire C1; //el carry bta3 el HA1


 xor(Product[4],A[2],B[2]); //el sign
and(Product[0],A[0],B[0]); //and 1
and(X1,A[0],B[1]);// and 2
and(X2,A[1],B[1]);//and 3
and(X3,A[1],B[0]);//and 4

halfadder HA1(
    .a(X1),
    .b(X3),
    .s(Product[1]),
    .c(C1)
);

halfadder HA2(
    .a(C1),
    .b(X2),
    .s(Product[2]),
    .c(Product[3])
);
assign ZF= ~(Product[3]|Product[1]|Product[2]|Product[0]);
assign SF= (Product[4]&~ZF);
endmodule