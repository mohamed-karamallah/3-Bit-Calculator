module fulladder(
input A2,B2,Cin,
output Sout,Cout
);
wire wire1, S1, C1;


half hafl1(
    .A1(A2),
    .B1(B2),
    .S1(S1),
    .C1(C1)


);
half half2(
    .A1(S1),
    .B1(Cin),
    .S1(Sout),
    .C1(wire1)
);

or or1(Cout,wire1,C1);


endmodule