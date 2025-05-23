module remainder (
    input wire [2:0] A,    
    input wire [2:0] B,    
    output reg [2:0] R,    
    output reg SF,         
    output reg ZF,        
    output reg DZF        
);
always @(*) begin
    DZF = 0;  
    ZF = 0;   
    SF = 0; 
    R = 3'b000;
    if (B == 3'b000||B==3'b100) begin
        DZF = 1;  
        R = 3'b000; 
    end else begin
        R = A % B;
        SF = A[2];        
        ZF = (R == 3'b000); 
    end
end
endmodule