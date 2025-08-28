module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
integer i;   // loop variable
     always @(negedge clk) begin
        if (reset) begin
            q <= 8'h34; // Reset value: 0x34
        end else begin
            q <= d;
        end
    end

endmodule



