module top_module ( );
    reg clk;
    dut inst0 (.clk(clk));
always # 5 clk=~clk;
    initial begin
        clk=0;
    end
endmodule
