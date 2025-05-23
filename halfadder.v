module halfadder (
    input a, b,
    output s, c
);
xor gate_xor (s, a, b);  
 and gate_and (c, a, b);  
 endmodule