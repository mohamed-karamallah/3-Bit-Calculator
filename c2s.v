module c2s(
    input W,
    input X,
    input Y,
    input Z,
    output U,
    output V,
    output T,
    output S
);
    wire xorwx;
    wire andybzb;
    wire andwybzb;
    wire andwz;
    
    xor(xorwx, X, W);
    and(andybzb, ~Y, ~Z);
    and(andwybzb, W, andybzb);
    or(V, andwybzb, xorwx);
    
    and(andwz, W, Z);
    xor(T, andwz, Y);
    
    assign U = W;
    assign S = Z;
endmodule
