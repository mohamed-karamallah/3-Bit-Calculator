module tb_multiplication;

    reg [2:0] A, B;           
    wire [4:0] Product;       
    wire ZF;                  
    wire SF;                  

    parameter MULT_FILENAME = "mult.txt";
    integer mult_file;        
        integer i, j;             
   
    multiplication dut (
        .A(A),
        .B(B),
        .Product(Product),
        .ZF(ZF),
        .SF(SF)
    );

    initial begin
        mult_file = $fopen(MULT_FILENAME, "w");
        if (mult_file == 0) begin
            $display("Error: Unable to open file %s", MULT_FILENAME);
            $finish;
        end

        $fwrite(mult_file, "A, B, Product, SF, ZF\n");

        for (i = -3; i <= 3; i = i + 1) begin
            for (j = -3; j <= 3; j = j + 1) begin
                 if (i < 0) begin
                A = {1'b1, (~i[1:0] + 1)};
            end else begin
                A = i;
            end

            if (j < 0) begin
                B = {1'b1, (~j[1:0] + 1)};
            end else begin
                B = j;
            end

                #100;
                 $display("A=%b B=%b | A * B = answer = %b | SF = %b ZF = %b\n", A, B, Product,SF,ZF);
                $fwrite(mult_file, "%0d, %0d, %0d, %b, %b\n", A, B, Product, SF, ZF);
            end
        end
        $fclose(mult_file);
        $finish;
    end

endmodule
