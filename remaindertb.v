`timescale 1ns/100ps
module rem_tb;
    reg signed [2:0] A, B;  
    wire signed [2:0] R;    
    wire SF, ZF, DZF;       
    integer file;          
    integer i, j;           
    reg signed [2:0] expected_R;
    reg expected_SF, expected_ZF, expected_DZF;
    remainder uut (
        .A(A),
        .B(B),
        .R(R),
        .SF(SF),
        .ZF(ZF),
        .DZF(DZF)
    );
    initial begin
        file = $fopen("rem.txt", "w");
        if (file == 0) begin
            $display("Error opening file!");
            $finish;
        end
        $fwrite(file, "A, B, R, SF, ZF, DZF, Result\n");
        for (i = -3; i <= 3; i = i + 1) begin
            for (j = -3; j <= 3; j = j + 1) begin
                A = i;  
                B = j;  
                #10;    
                expected_R = 0;
                expected_SF = 0;
                expected_ZF = 0;
                expected_DZF = 0;
                if (B == 0) begin
                    expected_DZF = 1; 
                    expected_R = 0;    
                end else begin
                    expected_R = A % B;  
                    expected_SF = (expected_R < 0) ? 1 : 0;  
                    expected_ZF = (expected_R == 0) ? 1 : 0; 
                end
                if (R === expected_R && SF === expected_SF && ZF === expected_ZF && DZF === expected_DZF) begin
                    $fwrite(file, "%d, %d, %d, %b, %b, %b, PASS\n", A, B, R, SF, ZF, DZF);
                    $display("Test Passed: A=%d, B=%d | R=%d, SF=%b, ZF=%b, DZF=%b", A, B, R, SF, ZF, DZF);
                end else begin
                    $fwrite(file, "%d, %d, %d, %b, %b, %b, FAIL\n", A, B, R, SF, ZF, DZF);
                    $display("Test Failed: A=%d, B=%d | Expected R=%d, SF=%b, ZF=%b, DZF=%b | Got R=%d, SF=%b, ZF=%b, DZF=%b",
                             A, B, expected_R, expected_SF, expected_ZF, expected_DZF, R, SF, ZF, DZF);
                end
            end
        end
        $fclose(file);
        $finish;
    end
endmodule
