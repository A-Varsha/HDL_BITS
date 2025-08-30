module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    //count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );
    wire [3:0]count4_Q;
    assign Q=count4_Q;
    assign c_enable=enable;
    assign c_load=((count4_Q==4'd12&& c_enable)||reset);
    assign c_d=4'd1;
    count4  the_counter(clk,c_enable,c_load,c_d,count4_Q);
    
endmodule
