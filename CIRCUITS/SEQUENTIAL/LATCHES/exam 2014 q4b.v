module top_module (
    input clk,      
    input ar, 
    input d,          
    output reg q     
);

    always @(posedge clk or posedge ar) begin
        if (ar)
            q <= 1'b0;      
        else
            q <= d;        
    end

endmodule

