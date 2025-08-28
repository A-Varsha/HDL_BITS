module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
  
integer i;   // loop variable

always @(posedge clk) begin
    if (reset) begin
        q <= 0;   // reset all flip-flops
    end else begin
        for (i = 0; i < 8; i = i + 1) begin
            q[i] <= d[i];  
        end
    end
end

endmodule

