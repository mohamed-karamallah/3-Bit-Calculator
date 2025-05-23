`timescale 1ns/100ps
module alu_tb;
    reg [1:0] S;
    reg signed [2:0] A, B;
    wire signed [4:0] R;
    wire ZF, DZF, SF;
    alu uut (
        .S(S),
        .A(A),
        .B(B),
        .R(R),
        .ZF(ZF),
        .DZF(DZF),
        .SF(SF)
    );
    initial begin
        $display("S   A   B   R   SF  ZF  DZF");
        $monitor("%b  %d  %d  %d  %b   %b   %b", S, A, B, R, SF, ZF, DZF);
        S = 2'b00; A = 3; B = -2; #10;
        S = 2'b01; A = -3; B = 2; #10;
        S = 2'b01; A = 3; B = 0;  #10; 
        S = 2'b10; A = -1; B = -2; #10;
        S = 2'b11; A = 2; B = -3; #10;
        $finish;
    end
endmodule