`timescale 1ns/1ps
module add_sub_tb;
reg [2:0] a;
reg [2:0] b;
reg O;
wire signn;
wire [3:0] answer;
wire zero_s;
parameter ADD_FILENAME = "add.txt";
parameter SUB_FILENAME = "sub.txt";

add_sub DUT(
    .A(a),
    .B(b),
    .o(O),
    .zeroo(zero_s),
    .R(answer),
    .signflag(signn)
    
    
);

integer i;
integer j;

integer add_file;
integer sub_file;

initial begin
    add_file = $fopen(ADD_FILENAME, "w");
    if (add_file == 0) begin
        $display("Error opening add.txt for writing.");
        $finish;
    end

    sub_file = $fopen(SUB_FILENAME, "w");
    if (sub_file == 0) begin
        $display("Error opening sub.txt for writing.");
        $fclose(add_file); 
        $finish;
    end

    // Addition loop
    O = 0; 
    for (i = -3; i <= 3; i = i + 1) begin
        for (j = -3; j <= 3; j = j + 1) begin
            if (i < 0) begin
                a = {1'b1, (~i[1:0] + 1)};
            end else begin
                a = i;
            end

            if (j < 0) begin
                b = {1'b1, (~j[1:0] + 1)};
            end else begin
                b = j;
            end

            #100;

            $display("A=%b B=%b | A + B = answer = %b | SF = %b ZF = %b\n", a, b, answer,signn,zero_s);

            $fwrite(add_file, "A=%b B=%b | A + B = answer = %b | SF = %b ZF = %b\n", a, b, answer,signn,zero_s);
        end
    end

    // Subtraction loop
    O = 1; 
    for (i = -3; i <= 3; i = i + 1) begin
        for (j = -3; j <= 3; j = j + 1) begin
            if (i < 0) begin
                a = {1'b1, (~i[1:0] + 1)};
            end else begin
                a = i;
            end

            if (j < 0) begin
                b = {1'b1, (~j[1:0] + 1)};
            end else begin
                b = j;
            end

            #100;

            $display("A=%b B=%b | A - B = answer = %b | SF = %b ZF = %b\n", a, b, answer,signn,zero_s);

            $fwrite(sub_file, "A=%b B=%b | A - B = answer = %b | SF = %b ZF = %b\n", a, b, answer,signn,zero_s);
        end
    end

    $fclose(add_file);
    $fclose(sub_file);

    $finish();
end

endmodule
