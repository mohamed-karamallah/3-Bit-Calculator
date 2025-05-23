module half(
    input A1,B1,
    output S1,C1
);
xor xor1(S1,A1,B1);
and and1(C1,A1,B1);

endmodule