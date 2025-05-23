module alu(
    input [1:0] S,          
    input  [2:0] A,   
    input  [2:0] B,   
    output reg  [4:0] R, 
    output reg ZF,          
    output reg DZF,       
    output reg SF           
);
    wire signed [3:0] add_sub_res; 
    wire signed [4:0] mult_res;    
    wire signed [2:0] rem_res;      
    wire DZ;
    add_sub add_sub_inst (
        .A(A),
        .B(B),
        .o(S[0]),         
        .R(add_sub_res)
    );
    multiplication multiplication (
        .A(A),
        .B(B),
        .Product(mult_res)
    );
    remainder rem_inst(
        .A(A),
        .B(B),
        .R( rem_res),
        .DZF(DZ)
        
    );

    always @(*) begin
        DZF=0;
        case (S)
            2'b00: begin
                R = mult_res;      
                SF = mult_res[4];   
                ZF = (R == 0);     
                        
            end
            2'b01: begin
                R = rem_res[1:0]; 
                SF = rem_res[2];   
                ZF = (R==0);
                DZF = DZ;    
            end
            2'b10: begin
                R = add_sub_res[2:0]; 
                SF = add_sub_res[3];
                R[4]=add_sub_res[3]; 
                ZF = (R[3:0] == 0);   
            end
            2'b11: begin
                R = add_sub_res[2:0]; 
                SF = add_sub_res[3];
                R[4]=add_sub_res[3]; 
                ZF = (R[3:0] == 0);            
            end
            default: begin
                R = 4'b0;
                SF = 0;
                ZF = 1;
                DZF = 0;
            end
        endcase
    end
endmodule