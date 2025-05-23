module add_sub(
    input [2:0] A,
    input [2:0] B,
    input o,  // o = 0 for addition, o = 1 for subtraction
    output wire zeroo,
    output wire [3:0] R,
    output wire signflag
   
);
cs2 cs2_a(
    .X(A[2]),
    .Y(A[1]),
    .Z(A[0]),
    .W(),
    .U(),
    .V()
);

cs2 cs2_b(
    .X(B[2]),
    .Y(B[1]),
    .Z(B[0]),
    .W(),
    .U(),
    .V()
);

wire b0m;
xor(b0m, o, cs2_b.V);

fulladder F01(
    .A2(cs2_a.V),
    .B2(b0m),
    .Cin(o),
    .Sout(),
    .Cout()
);

wire b1m;
xor(b1m, o, cs2_b.U);

fulladder F02(
    .A2(cs2_a.U),
    .B2(b1m),
    .Cin(F01.Cout),
    .Sout(),
    .Cout()
);

wire b2m;
xor(b2m, o, cs2_b.W);
fulladder F03(
    .A2(cs2_a.W),
    .B2(b2m),
    .Cin(F02.Cout),
    .Sout(),
    .Cout()
);

wire in1;
xor(in1, F02.Cout, F03.Cout);

wire in2;
xor(in2, F03.Sout, in1);
wire r0,r1,r2,si;
c2s c2s1(
    .W(in2),
    .X(F03.Sout),
    .Y(F02.Sout),
    .Z(F01.Sout),
    .U(si),
    .V(r2),
    .T(r1),
    .S(r0)
);
assign R[3] = si;
assign R[2] = r2;
assign R[1] = r1;
assign R[0]=r0;
assign zeroo = ~(|R[2:0]); // zero result sign
assign signflag=si;
endmodule