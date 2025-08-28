module top_module 
    (input clk,
    
    input [7:0] d,
    output [7:0] q
);
   
    reg rst;
integer i;   // loop variable

always @(posedge clk) begin
    if (rst) begin
        q <= 0;   // reset all flip-flops
    end else begin
        for (i = 0; i < 8; i = i + 1) begin
            q[i] <= d[i];  
        end
    end
end

endmodule
   
