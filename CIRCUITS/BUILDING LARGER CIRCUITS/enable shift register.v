module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    parameter [2:0] s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;
    reg[2:0] state,next_state;
    always @ (posedge clk )begin
        
        state<=next_state;
    end
    always @ (*)begin
        case (state)
            3'd0:next_state=reset?s1:s0;
            3'd1:next_state=s2;
            3'd2:next_state=s3;
            3'd3:next_state=s4;
            3'd4:next_state=s0;
        endcase
    end
    assign shift_ena=(state==s1)|(state==s2)|(state==s3)|(state==s4);
endmodule
