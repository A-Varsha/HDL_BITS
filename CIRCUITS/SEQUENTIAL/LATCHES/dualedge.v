module top_module (
    input clk,
    input d,
    output  q
);
    reg d_p,d_n;
    always @ (posedge clk)
       d_p<=d;
    always@(negedge clk)
         d_n<=d;
    assign q=(clk)? d_p:d_n;
    
    

endmodule
