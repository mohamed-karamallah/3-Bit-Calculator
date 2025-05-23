module cs2(
    input X,
    input Y,
    input Z,
    output W,
    output U,
    output V
);
    wire o1, o2, o3, o4, o5, o6, o7, o8;
    wire X_bar, Y_bar, Z_bar;
    
    not not1(X_bar, X);
    not not2(Y_bar, Y);
    not not3(Z_bar, Z);
    
    and and1(o1, X, Z);
    and and2(o2, X, Y);
    or or1(W, o1, o2);
    
    and and3(o3, Y, X_bar);
    and and4(o4, X, Y_bar);
    and and5(o5, Z, o4);
    or or2(o6, o5, o3);
    
    and and6(o7, Y, Z_bar);
    or(U, o6, o7);
    
    assign V = Z;
endmodule
    