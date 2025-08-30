module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable);

    wire [3:0] c0_Q,c1_Q,c2_Q;

    bcdcount counter0  (clk,reset,c_enable[0],c0_Q);
    bcdcount counter1  (clk,reset,c_enable[1],c1_Q);
    bcdcount counter2  (clk,reset,c_enable[2],c2_Q);
    
    
    assign c_enable[0] = 1'd1;           
    assign c_enable[1] =( c0_Q == 4'd9);   
    assign c_enable[2] = (c1_Q == 4'd9) && (c0_Q == 4'd9);
    assign OneHertz =(c0_Q == 4'd9)&&(c1_Q == 4'd9)&&(c2_Q == 4'd9);
    

endmodule

